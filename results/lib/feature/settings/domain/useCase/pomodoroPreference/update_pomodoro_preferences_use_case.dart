import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdatePomodoroPreferencesParams {
  final String userId;
  final Map<String, dynamic> preferences;

  UpdatePomodoroPreferencesParams({required this.userId, required this.preferences});
}

class UpdatePomodoroPreferencesUseCase extends UseCase<void, UpdatePomodoroPreferencesParams> {
  final PomodoroPreferenceRepository<void> pomodoroPreferenceRepository;

  UpdatePomodoroPreferencesUseCase({required this.pomodoroPreferenceRepository});

  @override
  Future<Either<Failure, void>> call(UpdatePomodoroPreferencesParams params) async {
    try {
      await pomodoroPreferenceRepository.updatePomodoroPreferences(params.userId, params.preferences);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update Pomodoro preferences'));
    }
  }
}
