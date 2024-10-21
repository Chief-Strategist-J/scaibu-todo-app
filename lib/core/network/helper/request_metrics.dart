/// Performance metrics tracking
class RequestMetrics {
  final DateTime startTime;
  DateTime? endTime;
  final List<Duration> attemptDurations;
  final List<dynamic> errors;

  RequestMetrics()
      : startTime = DateTime.now(),
        attemptDurations = [],
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

  void recordError(dynamic error) {
    errors.add(error);
    endAttempt();
  }

  Duration get totalDuration => endTime?.difference(startTime) ?? Duration.zero;

  double get averageAttemptDuration {
    if (attemptDurations.isEmpty) return 0;
    final total = attemptDurations.fold<int>(0, (sum, duration) => sum + duration.inMilliseconds);
    return total / attemptDurations.length;
  }
}