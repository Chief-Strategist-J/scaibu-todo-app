import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/callback/exceptions/sync_exception.dart';
import 'package:todo_app/core/callback/models/execute_result.dart';
import 'package:todo_app/core/callback/models/queued_operation.dart';
import 'package:todo_app/core/callback/utils/enums.dart';

/// A callback definition for asynchronous functions,
/// allowing better type safety when handling asynchronous operations.
typedef AsyncCallback<T> = Future<T> Function();

/// A callback definition for handling errors in asynchronous functions,
/// with support for capturing the error and its associated stack trace.
typedef ErrorHandler<E> = Future<void> Function(E error, StackTrace stackTrace);

/// A callback definition for validating data of a given type.
/// Returns `true` if the data is valid, `false` otherwise.
typedef ValidationCallback<T> = bool Function(T data);

/// A callback definition for transforming data of type `T` into type `R`.
/// Useful for mapping or converting data structures.
typedef TransformCallback<T, R> = R Function(T data);

/// Main class implementation
class CallbackHandler<T> {
  /// Factory constructor
  factory CallbackHandler() =>
      <Type, CallbackHandler<T>>{}.putIfAbsent(T, CallbackHandler<T>._internal);

  CallbackHandler._internal() {
    _initializeStreams();
    unawaited(_startPeriodicSync());
  }

  /// State management
  NetworkStatus _networkStatus = NetworkStatus.online;
  final List<QueuedOperation<T>> _operationQueue = <QueuedOperation<T>>[];
  final Map<String, T> _cache = <String, T>{};
  final Map<String, T> _pendingSync = <String, T>{};

  /// Configuration
  SyncStrategy _syncStrategy = SyncStrategy.immediate;
  Duration _syncInterval = const Duration(minutes: 5);
  int _maxRetries = 3;
  Duration _baseRetryDelay = const Duration(seconds: 1);

  /// Streams for reactive programming
  late StreamController<NetworkStatus> _networkStatusController;
  late StreamController<ExecuteResult<T>> _operationResultController;
  late StreamController<Map<String, T>> _syncProgressController;

  /// Configuration method
  Stream<NetworkStatus> get networkStatusStream =>
      _networkStatusController.stream;

  /// Configuration method
  Stream<ExecuteResult<T>> get operationResults =>
      _operationResultController.stream;

  /// Configuration method
  Stream<Map<String, T>> get syncProgress => _syncProgressController.stream;

  /// Initialize streams
  void _initializeStreams() {
    _networkStatusController = StreamController<NetworkStatus>.broadcast();
    _operationResultController = StreamController<ExecuteResult<T>>.broadcast();
    _syncProgressController = StreamController<Map<String, T>>.broadcast();
  }

  /// Configuration method
  void configure({
    final SyncStrategy? syncStrategy,
    final Duration? syncInterval,
    final int? maxRetries,
    final Duration? baseRetryDelay,
  }) {
    _syncStrategy = syncStrategy ?? _syncStrategy;
    _syncInterval = syncInterval ?? _syncInterval;
    _maxRetries = maxRetries ?? _maxRetries;
    _baseRetryDelay = baseRetryDelay ?? _baseRetryDelay;
  }

  /// Main execution method with offline support
  Future<ExecuteResult<T>> execute({
    required final String operationId,
    required final AsyncCallback<T> onlineOperation,
    final AsyncCallback<T>? offlineOperation,
    final ValidationCallback<T>? validator,
    final TransformCallback<T, T>? transformer,
    final Priority priority = Priority.medium,
    final Duration? timeout,
  }) async {
    try {
      final QueuedOperation<T> operation = QueuedOperation<T>(
        id: operationId,
        operation: onlineOperation,
        priority: priority,
        createdAt: DateTime.now(),
        timeout: timeout ?? const Duration(seconds: 30),
      );

      if (_networkStatus == NetworkStatus.online) {
        return await _executeOnline(operation, validator, transformer);
      } else {
        return await _executeOffline(
          operation,
          offlineOperation,
          validator,
          transformer,
        );
      }
    } catch (e, stackTrace) {
      await _handleError(e, stackTrace);
      return ExecuteResult<T>.failure(SyncException('Operation failed', e));
    }
  }

  /// Online execution implementation
  Future<ExecuteResult<T>> _executeOnline(
    final QueuedOperation<T> operation,
    final ValidationCallback<T>? validator,
    final TransformCallback<T, T>? transformer,
  ) async {
    try {
      final T result = await operation.operation();
      final bool validatedResult = validator?.call(result) ?? true;

      if (!validatedResult) {
        throw SyncException('Validation failed for operation: ${operation.id}');
      }

      final T transformedResult = transformer?.call(result) ?? result;
      _cache[operation.id] = transformedResult;

      _operationResultController
          .add(ExecuteResult<T>.success(transformedResult));
      return ExecuteResult<T>.success(transformedResult);
    } catch (e) {
      if (operation.retryCount < _maxRetries) {
        operation.retryCount++;
        await Future<T>.delayed(_calculateRetryDelay(operation.retryCount));
        return _executeOnline(operation, validator, transformer);
      }
      rethrow;
    }
  }

  /// Offline execution implementation
  Future<ExecuteResult<T>> _executeOffline(
    final QueuedOperation<T> operation,
    final AsyncCallback<T>? offlineOperation,
    final ValidationCallback<T>? validator,
    final TransformCallback<T, T>? transformer,
  ) async {
    try {
      if (offlineOperation != null) {
        final T offlineResult = await offlineOperation();
        _pendingSync[operation.id] = offlineResult;
        _queueOperation(operation);

        return ExecuteResult<T>.success(offlineResult);
      } else {
        _queueOperation(operation);
        return ExecuteResult<T>.failure(
          SyncException('No offline operation available for: ${operation.id}'),
        );
      }
    } catch (e) {
      return ExecuteResult<T>.failure(
        SyncException('Offline operation failed', e),
      );
    }
  }

  /// Queue management
  void _queueOperation(final QueuedOperation<T> operation) {
    _operationQueue.add(operation);
    _sortQueue();
  }

  void _sortQueue() {
    _operationQueue
        .sort((final QueuedOperation<T> a, final QueuedOperation<T> b) {
      final int priorityCompare = b.priority.index.compareTo(a.priority.index);
      if (priorityCompare != 0) {
        return priorityCompare;
      }
      return a.createdAt.compareTo(b.createdAt);
    });
  }

  /// Sync management
  Future<void> _startPeriodicSync() async {
    if (_syncStrategy == SyncStrategy.periodic) {
      Timer.periodic(_syncInterval, (final _) => _performSync());
    }
  }

  Future<void> _performSync() async {
    if (_networkStatus == NetworkStatus.offline || _operationQueue.isEmpty) {
      return;
    }

    final List<QueuedOperation<T>> operations =
        List<QueuedOperation<T>>.from(_operationQueue);
    _operationQueue.clear();

    for (final QueuedOperation<T> operation in operations) {
      try {
        final ExecuteResult<T> result =
            await _executeOnline(operation, null, null);
        if (result.isSuccess) {
          _pendingSync.remove(operation.id);
          _syncProgressController.add(_pendingSync);
        }
      } catch (e, stackTrace) {
        await _handleError(e, stackTrace);
        _queueOperation(operation);
      }
    }
  }

  /// Generic type definitions for better type safety
  Future<void> setNetworkStatus(final NetworkStatus status) async {
    if (_networkStatus != status) {
      _networkStatus = status;
      _networkStatusController.add(status);

      if (status == NetworkStatus.online) {
        switch (_syncStrategy) {
          case SyncStrategy.immediate:
            await _performSync();
          case SyncStrategy.batched:
            if (_operationQueue.length >= 5) {
              await _performSync();
            }
          case SyncStrategy.periodic:

            /// Handled by periodic timer
            break;
        }
      }
    }
  }

  /// Helper methods
  Duration _calculateRetryDelay(final int retryCount) =>
      _baseRetryDelay * pow(2, retryCount - 1);

  Future<void> _handleError(
    final dynamic error,
    final StackTrace stackTrace,
  ) async {
    debugPrint('Error occurred: $error');
    debugPrint('Stack trace: $stackTrace');

    /// Add your error handling logic here
  }

  /// Generic type definitions for better type safety
  T? getCached(final String id) => _cache[id];

  ///
  void clearCache([final String? id]) {
    if (id != null) {
      _cache.remove(id);
      _pendingSync.remove(id);
    } else {
      _cache.clear();
      _pendingSync.clear();
    }
  }

  /// Cleanup
  Future<void> dispose() async {
    await _networkStatusController.close();
    await _operationResultController.close();
    await _syncProgressController.close();
  }
}
