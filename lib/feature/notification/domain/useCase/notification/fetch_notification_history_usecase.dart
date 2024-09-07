import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_repository.dart'; // Adjust import path as necessary

class FetchNotificationHistoryParams {
  final String userId;

  FetchNotificationHistoryParams({
    required this.userId,
  });
}

class Notification {}

class FetchNotificationHistoryUseCase extends UseCase<List<Notification>, FetchNotificationHistoryParams> {
  final NotificationRepository<Notification> notificationRepository;

  FetchNotificationHistoryUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, List<Notification>>> call(FetchNotificationHistoryParams params) async {
    try {
      final history = await notificationRepository.fetchNotificationHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch notification history'));
    }
  }
}
