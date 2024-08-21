import 'package:todo_app/core/app_library.dart';

class GetPomodoroStatsUseCase<T> extends UseCase<PomodoroEntity, Map<String, dynamic>> {
  final PomodoroRepository<PomodoroEntity> pomodoroDatabaseRepository;
  final PomodoroRepository<PomodoroEntity> pomodoroFirebaseRepository;

  GetPomodoroStatsUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  @override
  Future<Either<Failure, PomodoroEntity>> call(Map<String, dynamic> params) async {
    try {
      PomodoroEntity stats = await pomodoroFirebaseRepository.getPomodoroStats(params);
      return Right(stats);
    } catch (e) {
      try {
        PomodoroEntity stats = await pomodoroDatabaseRepository.getPomodoroStats(params);
        return Right(stats);
      } catch (e) {
        return Left(ServerFailure('Failed to get Pomodoro stats'));
      }
    }
  }
}
