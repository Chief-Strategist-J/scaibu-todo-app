import 'package:todo_app/core/app_library.dart';

class GetHistoricalNotificationDataParams {
  GetHistoricalNotificationDataParams({
    required this.userId,
    required this.startDate,
    required this.endDate,
  });

  final String userId;
  final DateTime startDate;
  final DateTime endDate;
}

class GetHistoricalNotificationDataUseCase extends UseCase<
    List<NotificationEntity>, GetHistoricalNotificationDataParams> {
  GetHistoricalNotificationDataUseCase({
    required this.notificationAnalyticsRepository,
  });

  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final GetHistoricalNotificationDataParams params) async {
    try {
      final List<NotificationEntity> historicalData =
          await notificationAnalyticsRepository.getHistoricalNotificationData(
        params.userId,
        params.startDate,
        params.endDate,
      );

      return Right(historicalData);
    } catch (e) {
      return Left(ServerFailure('Failed to get historical notification data'));
    }
  }
}
