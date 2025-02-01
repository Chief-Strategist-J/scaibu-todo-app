part of use_case;

/// Doc Required
class UpdatePomodoroPreferencesParams {
  /// Doc Required
  UpdatePomodoroPreferencesParams({
    required this.userId,
    required this.preferences,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> preferences;
}

/// Doc Required
class UpdatePomodoroPreferencesUseCase
    extends UseCase<void, UpdatePomodoroPreferencesParams> {
  /// Doc Required
  UpdatePomodoroPreferencesUseCase({
    required this.pomodoroPreferenceRepository,
  });

  /// Doc Required
  final PomodoroPreferenceRepository<void> pomodoroPreferenceRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdatePomodoroPreferencesParams params,
  ) async {
    try {
      await pomodoroPreferenceRepository.updatePomodoroPreferences(
        params.userId,
        params.preferences,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update Pomodoro preferences'),
      );
    }
  }
}
