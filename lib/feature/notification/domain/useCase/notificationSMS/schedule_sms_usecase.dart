import 'package:todo_app/core/app_library.dart';

class ScheduleSMSParams {
  final String message;
  final String recipientPhoneNumber;
  final DateTime scheduleTime;

  ScheduleSMSParams({required this.message, required this.recipientPhoneNumber, required this.scheduleTime});
}

class ScheduleSMSUseCase extends UseCase<void, ScheduleSMSParams> {
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  ScheduleSMSUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, void>> call(ScheduleSMSParams params) async {
    try {
      await smsNotificationRepository.scheduleSMS(params.message, params.recipientPhoneNumber, params.scheduleTime);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to schedule SMS'));
    }
  }
}
