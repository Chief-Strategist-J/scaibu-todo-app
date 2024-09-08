import 'package:todo_app/core/app_library.dart'; 

class CancelScheduledSMSParams {
  final String smsId;

  CancelScheduledSMSParams({required this.smsId});
}

class CancelScheduledSMSUseCase extends UseCase<void, CancelScheduledSMSParams> {
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  CancelScheduledSMSUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, void>> call(CancelScheduledSMSParams params) async {
    try {
      await smsNotificationRepository.cancelScheduledSMS(params.smsId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel scheduled SMS'));
    }
  }
}
