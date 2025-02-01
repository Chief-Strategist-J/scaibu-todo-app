part of use_case;

// Temporary concrete /// Doc Required

/// Doc Required
class ConcretePomodoroPreferences {
  /// Doc Required
  ConcretePomodoroPreferences({
    required this.workDuration,
    required this.breakDuration,
    required this.longBreakDuration,
  });

  /// Doc Required
  final int workDuration;

  /// Doc Required
  final int breakDuration;

  /// Doc Required
  final int longBreakDuration;
}

/// Doc Required
class GetPomodoroPreferencesUseCase
    extends UseCase<ConcretePomodoroPreferences, String> {
  /// Doc Required
  GetPomodoroPreferencesUseCase({
    required this.pomodoroPreferenceRepository,
  });

  /// Doc Required
  final PomodoroPreferenceRepository<ConcretePomodoroPreferences>
      pomodoroPreferenceRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcretePomodoroPreferences>> call(
    final String params,
  ) async {
    try {
      final ConcretePomodoroPreferences preferences =
          await pomodoroPreferenceRepository.getPomodoroPreferences(params);
      return Right<Failure, ConcretePomodoroPreferences>(preferences);
    } catch (e) {
      return Left<Failure, ConcretePomodoroPreferences>(
        ServerFailure('Failed to get Pomodoro preferences'),
      );
    }
  }
}
