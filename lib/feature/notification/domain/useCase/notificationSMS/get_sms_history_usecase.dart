import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class GetSMSHistoryParams {
  final String userId;

  GetSMSHistoryParams({required this.userId});
}

class Notification {
  //
}

class GetSMSHistoryUseCase extends UseCase<List<Notification>, GetSMSHistoryParams> {
  final SMSNotificationRepository<Notification> smsNotificationRepository;

  GetSMSHistoryUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, List<Notification>>> call(GetSMSHistoryParams params) async {
    try {
      final history = await smsNotificationRepository.getSMSHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get SMS history'));
    }
  }
}
