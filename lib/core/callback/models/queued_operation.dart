import 'package:todo_app/core/callback/callback_handler.dart';
import 'package:todo_app/core/callback/utils/enums.dart';

/// Represents a queued operation with metadata and execution details.
class QueuedOperation<T> {
  /// Creates a [QueuedOperation] with the required parameters.
  QueuedOperation({
    required this.id,
    required this.operation,
    required this.createdAt,
    this.priority = Priority.medium,
    this.timeout = const Duration(seconds: 30),
  });

  /// Unique identifier for the operation.
  final String id;

  /// The asynchronous operation to be executed.
  final AsyncCallback<T> operation;

  /// The priority level of the operation.
  final Priority priority;

  /// The timestamp when the operation was created.
  final DateTime createdAt;

  /// The maximum allowed duration for the operation.
  final Duration timeout;

  /// The current retry count for the operation.
  int retryCount = 0;
}
