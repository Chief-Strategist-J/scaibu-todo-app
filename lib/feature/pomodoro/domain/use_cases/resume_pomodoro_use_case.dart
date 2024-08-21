import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/pomodoro/domain/repositories/pomodoro_repository.dart';

// TODO : Firebase is not implemented yet
class ResumePomodoroUseCase extends UseCase<void, String> {
  final PomodoroRepository pomodoroDatabaseRepository;
  final PomodoroRepository pomodoroFirebaseRepository;

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