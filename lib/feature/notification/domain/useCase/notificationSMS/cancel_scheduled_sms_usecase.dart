import 'package:todo_app/core/app_library.dart';

class CancelScheduledSMSParams {
  CancelScheduledSMSParams({required this.smsId});
  final String smsId;
}

class CancelScheduledSMSUseCase
    extends UseCase<void, CancelScheduledSMSParams> {
  CancelScheduledSMSUseCase({required this.smsNotificationRepository});
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final CancelScheduledSMSParams params) async {
    try {
      await smsNotificationRepository.cancelScheduledSMS(params.smsId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel scheduled SMS'));
    }
  }
}
