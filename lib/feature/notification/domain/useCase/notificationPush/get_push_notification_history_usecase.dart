import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class GetPushNotificationHistoryParams {
  final String userId;

  GetPushNotificationHistoryParams({required this.userId});
}

class Notification{}

class GetPushNotificationHistoryUseCase extends UseCase<List<Notification>, GetPushNotificationHistoryParams> {
  final PushNotificationRepository<Notification> pushNotificationRepository;

  GetPushNotificationHistoryUseCase({
    required this.pushNotificationRepository,
  });

  @override
  Future<Either<Failure, List<Notification>>> call(GetPushNotificationHistoryParams params) async {
    try {
      final history = await pushNotificationRepository.getPushNotificationHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get push notification history'));
    }
  }
}
