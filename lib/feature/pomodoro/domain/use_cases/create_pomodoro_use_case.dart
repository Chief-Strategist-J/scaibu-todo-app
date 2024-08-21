import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/pomodoro/domain/repositories/pomodoro_repository.dart';

// TODO : Firebase is not implemented yet
class CreatePomodoroUseCase extends UseCase<void, Map<String, dynamic>> {
  final PomodoroRepository pomodoroDatabaseRepository;
  final PomodoroRepository pomodoroFirebaseRepository;

  CreatePomodoroUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      await pomodoroDatabaseRepository.createPomodoro(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to create Pomodoro'));
    }
  }
}
