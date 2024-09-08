import 'package:todo_app/core/app_library.dart';

class NotificationAnalyticsImpl extends NotificationAnalyticsRepository<NotificationEntity> {
  @override
  Future<List<NotificationEntity>> getHistoricalNotificationData(String userId, DateTime startDate, DateTime endDate) {
    // TODO: implement getHistoricalNotificationData
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getNotificationEngagementReport(String userId) {
    // TODO: implement getNotificationEngagementReport
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getNotificationStatistics(String userId) {
    // TODO: implement getNotificationStatistics
    throw UnimplementedError();
  }

  @override
  Future<void> trackNotificationDelivery(String notificationId) {
    // TODO: implement trackNotificationDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> trackNotificationOpenRate(String notificationId) {
    // TODO: implement trackNotificationOpenRate
    throw UnimplementedError();
  }
}
