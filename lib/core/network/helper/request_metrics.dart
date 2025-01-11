/// Performance metrics tracking
class RequestMetrics {
  final DateTime startTime;
  DateTime? endTime;
  final List<Duration> attemptDurations;
  final List<dynamic> errors;

  RequestMetrics()
      : startTime = DateTime.now(),
        attemptDurations = <Duration>[],
        errors = [];

  DateTime? _currentAttemptStart;

  void startAttempt() {
    _currentAttemptStart = DateTime.now();
  }

  void endAttempt() {
    if (_currentAttemptStart != null) {
      attemptDurations.add(DateTime.now().difference(_currentAttemptStart!));
      _currentAttemptStart = null;
    }
    endTime = DateTime.now();
  }

  void recordError(final dynamic error) {
    errors.add(error);
    endAttempt();
  }

  Duration get totalDuration => endTime?.difference(startTime) ?? Duration.zero;

  Future<double> get averageAttemptDuration async {
    if (attemptDurations.isEmpty) {
      return 0;
    }
    final int total = attemptDurations.fold<int>(
        0,
        (final int sum, final Duration duration) =>
            sum + duration.inMilliseconds);
    return total / attemptDurations.length;
  }
}
