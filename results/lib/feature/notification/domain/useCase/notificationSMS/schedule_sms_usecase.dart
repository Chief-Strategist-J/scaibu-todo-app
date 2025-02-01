import 'package:todo_app/core/app_library.dart';

class ScheduleSMSParams {
  ScheduleSMSParams(
      {required this.message,
      required this.recipientPhoneNumber,
      required this.scheduleTime});
  final String message;
  final String recipientPhoneNumber;
  final DateTime scheduleTime;
}

class ScheduleSMSUseCase extends UseCase<void, ScheduleSMSParams> {
  ScheduleSMSUseCase({required this.smsNotificationRepository});
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, void>> call(final ScheduleSMSParams params) async {
    try {
      await smsNotificationRepository.scheduleSMS(
          params.message, params.recipientPhoneNumber, params.scheduleTime);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to schedule SMS'));
    }
  }
}
