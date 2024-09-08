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

// Define HistoricalNotificationData according to your application's needs

class HistoricalNotificationData {
  // Define properties for historical notification data
}

class GetHistoricalNotificationDataUseCase extends UseCase<List<HistoricalNotificationData>, GetHistoricalNotificationDataParams> {
  final NotificationAnalyticsRepository<HistoricalNotificationData> notificationAnalyticsRepository;

  GetHistoricalNotificationDataUseCase({
    required this.notificationAnalyticsRepository,
  });

  @override
  Future<Either<Failure, List<HistoricalNotificationData>>> call(GetHistoricalNotificationDataParams params) async {
    try {
      final historicalData = await notificationAnalyticsRepository.getHistoricalNotificationData(params.userId, params.startDate, params.endDate);
      return Right(historicalData);
    } catch (e) {
      return Left(ServerFailure('Failed to get historical notification data'));
    }
  }
}
