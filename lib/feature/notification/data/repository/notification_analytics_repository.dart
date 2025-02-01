import 'package:todo_app/core/app_library.dart';

/// Doc Required
class NotificationAnalyticsImpl
    extends NotificationAnalyticsRepository<NotificationEntity> {
  @override
  Future<List<NotificationEntity>> getHistoricalNotificationData(
    final String userId,
    final DateTime startDate,
    final DateTime endDate,
  ) {
    // TO-DO: implement getHistoricalNotificationData
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getNotificationEngagementReport(
    final String userId,
  ) {
    // TO-DO: implement getNotificationEngagementReport
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getNotificationStatistics(final String userId) {
    // TO-DO: implement getNotificationStatistics
    throw UnimplementedError();
  }

  @override
  Future<void> trackNotificationDelivery(final String notificationId) {
    // TO-DO: implement trackNotificationDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> trackNotificationOpenRate(final String notificationId) {
    // TO-DO: implement trackNotificationOpenRate
    throw UnimplementedError();
  }
}
