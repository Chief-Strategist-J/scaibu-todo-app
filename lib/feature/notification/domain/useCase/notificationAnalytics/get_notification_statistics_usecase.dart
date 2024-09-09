import 'package:todo_app/core/app_library.dart';

class GetNotificationStatisticsParams {
  final String userId;

  GetNotificationStatisticsParams({required this.userId});
}

class GetNotificationStatisticsUseCase extends UseCase<NotificationEntity, GetNotificationStatisticsParams> {
  final NotificationAnalyticsRepository<NotificationEntity> notificationAnalyticsRepository;

  GetNotificationStatisticsUseCase({required this.notificationAnalyticsRepository});

  @override
  Future<Either<Failure, NotificationEntity>> call(GetNotificationStatisticsParams params) async {
    try {
      final statistics = await notificationAnalyticsRepository.getNotificationStatistics(params.userId);
      return Right(statistics);
    } catch (e) {
      return Left(ServerFailure('Failed to get notification statistics'));
    }
  }
}
