/// Wrapper class for handling the results of operations, including errors.
class ExecuteResult<T> {
  /// Creates a successful [ExecuteResult] with the given data.
  ExecuteResult.success(this.data)
      : error = null,
        isSuccess = true;

  /// Creates a failed [ExecuteResult] with the given error.
  ExecuteResult.failure(this.error)
      : data = null,
        isSuccess = false;

  /// The result data, if the operation was successful.
  final T? data;

  /// The error encountered, if the operation failed.
  final Exception? error;

  /// Indicates whether the operation was successful.
  final bool isSuccess;

  /// Applies either [onSuccess] or [onError] depending on the result.
  R fold<R>(
    final R Function(T data) onSuccess,
    final R Function(Exception error) onError,
  ) =>
      isSuccess ? onSuccess(data as T) : onError(error!);
}
