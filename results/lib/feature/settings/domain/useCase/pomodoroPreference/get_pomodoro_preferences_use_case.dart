import 'package:todo_app/core/app_library.dart';


// Temporary concrete class for demonstration
class ConcretePomodoroPreferences {
  final int workDuration;
  final int breakDuration;
  final int longBreakDuration;

  ConcretePomodoroPreferences({
    required this.workDuration,
    required this.breakDuration,
    required this.longBreakDuration,
  });
}

class GetPomodoroPreferencesUseCase extends UseCase<ConcretePomodoroPreferences, String> {
  final PomodoroPreferenceRepository<ConcretePomodoroPreferences> pomodoroPreferenceRepository;

  GetPomodoroPreferencesUseCase({
    required this.pomodoroPreferenceRepository,
  });

  @override
  Future<Either<Failure, ConcretePomodoroPreferences>> call(String params) async {
    try {
      final preferences = await pomodoroPreferenceRepository.getPomodoroPreferences(params);
      return Right(preferences);
    } catch (e) {
      return Left(ServerFailure('Failed to get Pomodoro preferences'));
    }
  }
}
