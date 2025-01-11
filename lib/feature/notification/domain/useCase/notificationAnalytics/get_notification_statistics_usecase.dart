import 'package:todo_app/core/app_library.dart';

class GetNotificationStatisticsParams {
  GetNotificationStatisticsParams({required this.userId});
  final String userId;
}

class GetNotificationStatisticsUseCase
    extends UseCase<NotificationEntity, GetNotificationStatisticsParams> {
  GetNotificationStatisticsUseCase(
      {required this.notificationAnalyticsRepository});

  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
      final GetNotificationStatisticsParams params) async {
    try {
      final NotificationEntity statistics =
          await notificationAnalyticsRepository
              .getNotificationStatistics(params.userId);
      return Right(statistics);
    } catch (e) {
      return Left(ServerFailure('Failed to get notification statistics'));
    }
  }
}
