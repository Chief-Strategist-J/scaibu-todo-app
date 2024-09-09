import 'package:todo_app/core/app_library.dart';

class GetHistoricalNotificationDataParams {
  final String userId;
  final DateTime startDate;
  final DateTime endDate;

  GetHistoricalNotificationDataParams({
    required this.userId,
    required this.startDate,
    required this.endDate,
  });
}

class GetHistoricalNotificationDataUseCase extends UseCase<List<NotificationEntity>, GetHistoricalNotificationDataParams> {
  final NotificationAnalyticsRepository<NotificationEntity> notificationAnalyticsRepository;

  GetHistoricalNotificationDataUseCase({required this.notificationAnalyticsRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(GetHistoricalNotificationDataParams params) async {
    try {
      final historicalData = await notificationAnalyticsRepository.getHistoricalNotificationData(params.userId, params.startDate, params.endDate);
      return Right(historicalData);
    } catch (e) {
      return Left(ServerFailure('Failed to get historical notification data'));
    }
  }
}
