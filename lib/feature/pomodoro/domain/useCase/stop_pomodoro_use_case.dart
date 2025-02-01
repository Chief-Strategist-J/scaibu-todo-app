part of use_case;

// TO-DO : Firebase is not implemented yet
/// Doc Required
class StopPomodoroUseCase extends UseCase<void, String> {
  /// Doc Required
  StopPomodoroUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  /// Doc Required
  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;

  /// Doc Required
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await pomodoroDatabaseRepository.stopPomodoro(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to stop pomodoro'));
    }
  }
}
