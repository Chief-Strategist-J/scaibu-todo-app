part of use_case;

/// Doc Required
class SendSMSParams {
  /// Doc Required
  SendSMSParams({required this.message, required this.recipientPhoneNumber});

  /// Doc Required
  final String message;

  /// Doc Required
  final String recipientPhoneNumber;
}

/// Doc Required
class SendSMSUseCase extends UseCase<void, SendSMSParams> {
  /// Doc Required
  SendSMSUseCase({required this.smsNotificationRepository});

  /// Doc Required
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, void>> call(final SendSMSParams params) async {
    try {
      await smsNotificationRepository.sendSMS(
        params.message,
        params.recipientPhoneNumber,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to send SMS'));
    }
  }
}
