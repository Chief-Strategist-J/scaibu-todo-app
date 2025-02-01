part of use_case;

/// Doc Required
class GetPomodoroStatsUseCase<T>
    extends UseCase<PomodoroEntity, Map<String, dynamic>> {
  /// Doc Required
  GetPomodoroStatsUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  /// Doc Required
  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;

  /// Doc Required
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  @override
  Future<Either<Failure, PomodoroEntity>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      final PomodoroEntity stats =
          await pomodoroFirebaseRepository.getPomodoroStats(params);
      return Right<Failure, PomodoroEntity>(stats);
    } catch (e) {
      try {
        final PomodoroEntity stats =
            await pomodoroDatabaseRepository.getPomodoroStats(params);
        return Right<Failure, PomodoroEntity>(stats);
      } catch (e) {
        return Left<Failure, PomodoroEntity>(
          ServerFailure('Failed to get Pomodoro stats'),
        );
      }
    }
  }
}
