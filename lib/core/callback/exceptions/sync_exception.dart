/// Custom exceptions class for synchronization errors.
class SyncException implements Exception {
  /// Creates a [SyncException] with a message and an optional original error.
  SyncException(this.message, [this.originalError]);

  /// A message describing the exceptions.
  final String message;

  /// An optional reference to the original error.
  final dynamic originalError;

  @override
  String toString() => 'SyncException: $message${originalError != null ? '\n'
      'Original error: $originalError' : ''}';
}
