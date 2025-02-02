/// Performance metrics tracking
/// Tracks the metrics of a request including attempt durations and errors.
class RequestMetrics {
  /// Initializes metrics tracking with the start time.
  RequestMetrics()
      : startTime = DateTime.now(),
        attemptDurations = <Duration>[],
        errors = <dynamic>[];

  /// The start time of the request.
  final DateTime startTime;

  /// The end time of the request, nullable to handle in-progress requests.
  DateTime? endTime;

  /// List of durations for each attempt made.
  final List<Duration> attemptDurations;

  /// List of errors recorded during the request attempts.
  final List<dynamic> errors;

  DateTime? _currentAttemptStart;

  /// Starts a new attempt by recording the current time.
  void startAttempt() {
    _currentAttemptStart = DateTime.now();
  }

  /// Ends the current attempt, recording its duration.
  void endAttempt() {
    if (_currentAttemptStart != null) {
      attemptDurations.add(DateTime.now().difference(_currentAttemptStart!));
      _currentAttemptStart = null;
    }
    endTime = DateTime.now();
  }

  /// Records an error and ends the attempt.
  void recordError(final dynamic error) {
    errors.add(error);
    endAttempt();
  }

  /// Returns the total duration from start to end.
  Duration get totalDuration => endTime?.difference(startTime) ?? Duration.zero;

  /// Calculates the average duration of all attempts.
  Future<double> get averageAttemptDuration async {
    if (attemptDurations.isEmpty) {
      return 0;
    }
    final int total = attemptDurations.fold<int>(
      0,
      (final int sum, final Duration duration) => sum + duration.inMilliseconds,
    );
    return total / attemptDurations.length;
  }
}
