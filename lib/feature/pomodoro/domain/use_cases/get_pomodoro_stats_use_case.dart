import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/pomodoro/domain/repositories/pomodoro_repository.dart';

class GetPomodoroStatsUseCase<T> extends UseCase<T, Map<String, dynamic>> {
  final PomodoroRepository pomodoroDatabaseRepository;
  final PomodoroRepository pomodoroFirebaseRepository;

  GetPomodoroStatsUseCase({
    required this.pomodoroDatabaseRepository,
    required this.pomodoroFirebaseRepository,
  });

  @override
  Future<Either<Failure, T>> call(Map<String, dynamic> params) async {
    try {
      T stats = await pomodoroFirebaseRepository.getPomodoroStats(params);
      return Right(stats);
    } catch (e) {
      try {
        T stats = await pomodoroDatabaseRepository.getPomodoroStats(params);
        return Right(stats);
      } catch (e) {
        return Left(ServerFailure('Failed to get Pomodoro stats'));
      }
    }
  }
}
