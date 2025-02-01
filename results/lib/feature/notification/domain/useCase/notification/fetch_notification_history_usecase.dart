import 'package:todo_app/core/app_library.dart';

class FetchNotificationHistoryParams {

  FetchNotificationHistoryParams({required this.userId});
  final String userId;
}

class FetchNotificationHistoryUseCase
    extends UseCase<List<NotificationEntity>, FetchNotificationHistoryParams> {

  FetchNotificationHistoryUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final FetchNotificationHistoryParams params) async {
    try {
      final List<NotificationEntity> history =
          await notificationRepository.fetchNotificationHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch notification history'));
    }
  }
}
