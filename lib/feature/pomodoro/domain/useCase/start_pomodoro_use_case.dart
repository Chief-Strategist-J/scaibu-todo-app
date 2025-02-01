part of use_case;

/// Doc Required
class StartPomodoroUseCase extends UseCase<void, String> {
  /// Doc Required
  StartPomodoroUseCase({
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
      await pomodoroDatabaseRepository.startPomodoro(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to start pomodoro'));
    }
  }
}
