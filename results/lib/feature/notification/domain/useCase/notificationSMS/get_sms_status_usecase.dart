import 'package:todo_app/core/app_library.dart';

class GetSMSStatusParams {
  const GetSMSStatusParams({required this.smsId});
  final String smsId;
}

class GetSMSStatusUseCase
    extends UseCase<NotificationEntity, GetSMSStatusParams> {
  GetSMSStatusUseCase({required this.smsNotificationRepository});

  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
      final GetSMSStatusParams params) async {
    try {
      final NotificationEntity status =
          await smsNotificationRepository.getSMSStatus(params.smsId);

      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get SMS status'));
    }
  }
}
