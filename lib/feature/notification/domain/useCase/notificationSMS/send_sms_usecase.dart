import 'package:todo_app/core/app_library.dart';

class SendSMSParams {
  final String message;
  final String recipientPhoneNumber;

  SendSMSParams({required this.message, required this.recipientPhoneNumber});
}

class SendSMSUseCase extends UseCase<void, SendSMSParams> {
  final SMSNotificationRepository smsNotificationRepository;

  SendSMSUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, void>> call(SendSMSParams params) async {
    try {
      await smsNotificationRepository.sendSMS(params.message, params.recipientPhoneNumber);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send SMS'));
    }
  }
}
