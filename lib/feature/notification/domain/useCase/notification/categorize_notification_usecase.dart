import 'package:todo_app/core/app_library.dart';

class CategorizeNotificationParams {
  final String notificationId;
  final String category;

  CategorizeNotificationParams({required this.notificationId, required this.category});
}

class CategorizeNotificationUseCase extends UseCase<void, CategorizeNotificationParams> {
  final NotificationRepository notificationRepository;

  CategorizeNotificationUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(CategorizeNotificationParams params) async {
    try {
      await notificationRepository.categorizeNotification(params.notificationId, params.category);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to categorize notification'));
    }
  }
}
