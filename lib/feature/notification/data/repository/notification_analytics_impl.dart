import 'package:todo_app/feature/notification/domain/repository/notification_analytics_repository.dart';

class NotificationAnalyticsImpl extends NotificationAnalyticsRepository {
  @override
  Future<List> getHistoricalNotificationData(String userId, DateTime startDate, DateTime endDate) {
    // TODO: implement getHistoricalNotificationData
    throw UnimplementedError();
  }

  @override
  Future getNotificationEngagementReport(String userId) {
    // TODO: implement getNotificationEngagementReport
    throw UnimplementedError();
  }

  @override
  Future getNotificationStatistics(String userId) {
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
