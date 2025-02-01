part of use_case;

// TO-DO : Firebase is not implemented yet
/// Doc Required
class CreatePomodoroUseCase extends UseCase<void, Map<String, dynamic>> {
  /// Doc Required
  CreatePomodoroUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  /// Doc Required
  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;

  /// Doc Required
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final Map<String, dynamic> params) async {
    try {
      await pomodoroDatabaseRepository.createPomodoro(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to create Pomodoro'));
    }
  }
}
