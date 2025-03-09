import 'dart:async';
import 'dart:io';
import 'dart:isolate';

/// Extension providing high-performance stream collection
extension HighScalableStreamUtils<T> on Stream<T> {
  /// Collects stream elements with configurable batching and parallelism
  ///
  /// Parameters:
  ///   - batchSize: Number of elements to process in each batch
  ///     (default: 10000)
  ///   - isolateCount: Number of isolates for parallel processing
  ///     (default: based on CPU cores)
  ///   - transformFn: Optional transformation function applied to each element
  Future<List<R>> awaitingStream<R>({
    final int batchSize = 10000,
    int? isolateCount,
    final R Function(T)? transformFn,
  }) async {
    // Default to available processor count if not specified
    isolateCount ??= Platform.numberOfProcessors;

    if (isolateCount <= 1 || batchSize <= 100) {
      // For small workloads, use simple collection with optional transformation
      if (transformFn != null) {
        return map(transformFn).toList();
      }
      return toList() as Future<List<R>>;
    }

    // For large datasets, implement batched processing with isolates
    final Stream<List<T>> batches = bufferChunked(batchSize);
    final Completer<List<R>> completer = Completer<List<R>>();
    final List<R> results = <R>[];
    final List<Isolate> activeIsolates = <Isolate>[];
    final ReceivePort receivePort = ReceivePort();
    int pendingBatches = 0;

    receivePort.listen((final dynamic message) {
      if (message is List<R>) {
        results.addAll(message);
        pendingBatches--;

        if (pendingBatches <= 0) {
          // Clean up isolates
          for (final Isolate isolate in activeIsolates) {
            isolate.kill(priority: Isolate.immediate);
          }
          receivePort.close();
          completer.complete(results);
        }
      }
    });

    try {
      await for (final List<T> batch in batches) {
        pendingBatches++;

        // Process batch in isolate
        final Isolate isolate = await Isolate.spawn(
          _processBatchIsolate<T, R>,
          _BatchProcessMessage<T, R>(
            batch,
            transformFn,
            receivePort.sendPort,
          ),
        );

        activeIsolates.add(isolate);

        // Limit concurrent isolates
        if (activeIsolates.length >= isolateCount) {
          await Future<dynamic>.delayed(Duration.zero);
        }
      }

      // Handle empty stream case
      if (pendingBatches == 0) {
        receivePort.close();
        return <R>[];
      }
    } catch (e) {
      // Clean up on error
      for (final Isolate isolate in activeIsolates) {
        isolate.kill(priority: Isolate.immediate);
      }
      receivePort.close();
      rethrow;
    }

    return completer.future;
  }

  /// Creates a stream that emits lists of elements, each with maximum size
  /// [size]
  Stream<List<T>> bufferChunked(final int size) {
    final StreamController<List<T>> controller = StreamController<List<T>>();
    final List<T> buffer = <T>[];

    late StreamSubscription<T> subscription;
    subscription = listen(
      (final T data) {
        buffer.add(data);
        if (buffer.length >= size) {
          controller.add(List<T>.from(buffer));
          buffer.clear();
        }
      },
      onError: controller.addError,
      onDone: () async {
        if (buffer.isNotEmpty) {
          controller.add(List<T>.from(buffer));
        }
        await controller.close();
      },
    );

    controller.onCancel = () async => subscription.cancel();
    return controller.stream;
  }
}

/// Message container for isolate communication
class _BatchProcessMessage<T, R> {
  _BatchProcessMessage(this.batch, this.transformFn, this.sendPort);

  final List<T> batch;
  final R Function(T)? transformFn;
  final SendPort sendPort;
}

/// Isolate entry point for batch processing
void _processBatchIsolate<T, R>(final _BatchProcessMessage<T, R> message) {
  final List<R> results = <R>[];

  try {
    if (message.transformFn != null) {
      for (final T item in message.batch) {
        results.add(message.transformFn!(item));
      }
    } else {
      results.addAll(message.batch as List<R>);
    }

    message.sendPort.send(results);
  } catch (e) {
    message.sendPort.send(e);
  }
}
