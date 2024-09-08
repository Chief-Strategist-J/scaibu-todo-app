import 'package:todo_app/core/app_library.dart';

class FetchNotificationHistoryParams {
  final String userId;

  FetchNotificationHistoryParams({required this.userId});
}

class FetchNotificationHistoryUseCase extends UseCase<List<NotificationEntity>, FetchNotificationHistoryParams> {
  final NotificationRepository<NotificationEntity> notificationRepository;

  FetchNotificationHistoryUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(FetchNotificationHistoryParams params) async {
    try {
      final history = await notificationRepository.fetchNotificationHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch notification history'));
    }
  }
}
