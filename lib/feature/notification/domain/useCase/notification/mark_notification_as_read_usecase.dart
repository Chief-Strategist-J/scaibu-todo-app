import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_repository.dart'; // Adjust import path as necessary

class MarkNotificationAsReadParams {
  final String notificationId;

  MarkNotificationAsReadParams({required this.notificationId});
}

class MarkNotificationAsReadUseCase extends UseCase<void, MarkNotificationAsReadParams> {
  final NotificationRepository notificationRepository;

  MarkNotificationAsReadUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(MarkNotificationAsReadParams params) async {
    try {
      await notificationRepository.markNotificationAsRead(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to mark notification as read'));
    }
  }
}
