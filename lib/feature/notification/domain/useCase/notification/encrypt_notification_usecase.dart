import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class EncryptNotificationParams {
  final String notificationId;

  EncryptNotificationParams({required this.notificationId});
}

class EncryptNotificationUseCase extends UseCase<void, EncryptNotificationParams> {
  final NotificationRepository<void> notificationRepository;

  EncryptNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(EncryptNotificationParams params) async {
    try {
      await notificationRepository.encryptNotification(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to encrypt notification'));
    }
  }
}
