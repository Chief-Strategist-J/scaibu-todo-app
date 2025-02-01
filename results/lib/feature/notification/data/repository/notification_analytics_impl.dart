import 'package:todo_app/core/app_library.dart';

class NotificationAnalyticsImpl
    extends NotificationAnalyticsRepository<NotificationEntity> {
  @override
  Future<List<NotificationEntity>> getHistoricalNotificationData(
      final String userId, final DateTime startDate, final DateTime endDate) {
    // TODO: implement getHistoricalNotificationData
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getNotificationEngagementReport(
      final String userId) {
    // TODO: implement getNotificationEngagementReport
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getNotificationStatistics(final String userId) {
    // TODO: implement getNotificationStatistics
    throw UnimplementedError();
  }

  @override
  Future<void> trackNotificationDelivery(final String notificationId) {
    // TODO: implement trackNotificationDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> trackNotificationOpenRate(final String notificationId) {
    // TODO: implement trackNotificationOpenRate
    throw UnimplementedError();
  }
}
