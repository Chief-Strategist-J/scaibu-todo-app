import 'package:todo_app/core/app_library.dart';

class GetNotificationStatisticsParams {
  final String userId;

  GetNotificationStatisticsParams({required this.userId});
}

// TODO : TEMP FIX CHANGE LATER WHEN YOU CREATE THE MODELS
class Empty {}

class GetNotificationStatisticsUseCase extends UseCase<Empty, GetNotificationStatisticsParams> {
  final NotificationAnalyticsRepository<Empty> notificationAnalyticsRepository;

  GetNotificationStatisticsUseCase({
    required this.notificationAnalyticsRepository,
  });

  @override
  Future<Either<Failure, Empty>> call(GetNotificationStatisticsParams params) async {
    try {
      final statistics = await notificationAnalyticsRepository.getNotificationStatistics(params.userId);
      return Right(statistics);
    } catch (e) {
      return Left(ServerFailure('Failed to get notification statistics'));
    }
  }
}
