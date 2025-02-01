import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class RetryNotificationDeliveryParams {
  RetryNotificationDeliveryParams({required this.notificationId});
  final String notificationId;
}

class RetryNotificationDeliveryUseCase
    extends UseCase<void, RetryNotificationDeliveryParams> {
  RetryNotificationDeliveryUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final RetryNotificationDeliveryParams params) async {
    try {
      await notificationRepository
          .retryNotificationDelivery(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to retry notification delivery'));
    }
  }
}
