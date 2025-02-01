import 'package:todo_app/core/app_library.dart';

class SendSMSParams {
  SendSMSParams({required this.message, required this.recipientPhoneNumber});
  final String message;
  final String recipientPhoneNumber;
}

class SendSMSUseCase extends UseCase<void, SendSMSParams> {
  SendSMSUseCase({required this.smsNotificationRepository});
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, void>> call(final SendSMSParams params) async {
    try {
      await smsNotificationRepository.sendSMS(
          params.message, params.recipientPhoneNumber);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send SMS'));
    }
  }
}
