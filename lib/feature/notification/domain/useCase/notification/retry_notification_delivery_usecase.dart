import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class RetryNotificationDeliveryParams {
  final String notificationId;

  RetryNotificationDeliveryParams({required this.notificationId});
}

class RetryNotificationDeliveryUseCase extends UseCase<void, RetryNotificationDeliveryParams> {
  final NotificationRepository<void> notificationRepository;

  RetryNotificationDeliveryUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(RetryNotificationDeliveryParams params) async {
    try {
      await notificationRepository.retryNotificationDelivery(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to retry notification delivery'));
    }
  }
}
