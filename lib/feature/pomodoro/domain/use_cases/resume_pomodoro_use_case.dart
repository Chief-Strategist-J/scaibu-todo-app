import 'package:todo_app/core/app_library.dart';

// TODO : Firebase is not implemented yet
class ResumePomodoroUseCase extends UseCase<void, String> {
  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  ResumePomodoroUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await pomodoroDatabaseRepository.resumePomodoro(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to resume pomodoro'));
    }
  }
}
