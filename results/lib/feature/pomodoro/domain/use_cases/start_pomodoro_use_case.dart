import 'package:todo_app/core/app_library.dart';

// TODO : Firebase is not implemented yet

class StartPomodoroUseCase extends UseCase<void, String> {
  StartPomodoroUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await pomodoroDatabaseRepository.startPomodoro(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to start pomodoro'));
    }
  }
}
