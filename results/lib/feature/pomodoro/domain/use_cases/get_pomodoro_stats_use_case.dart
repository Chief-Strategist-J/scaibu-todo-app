import 'package:todo_app/core/app_library.dart';

class GetPomodoroStatsUseCase<T>
    extends UseCase<PomodoroEntity, Map<String, dynamic>> {
  GetPomodoroStatsUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });
  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  @override
  Future<Either<Failure, PomodoroEntity>> call(
      final Map<String, dynamic> params) async {
    try {
      final PomodoroEntity stats =
          await pomodoroFirebaseRepository.getPomodoroStats(params);
      return Right(stats);
    } catch (e) {
      try {
        final PomodoroEntity stats =
            await pomodoroDatabaseRepository.getPomodoroStats(params);
        return Right(stats);
      } catch (e) {
        return Left(ServerFailure('Failed to get Pomodoro stats'));
      }
    }
  }
}
