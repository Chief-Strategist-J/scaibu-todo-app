import 'package:todo_app/core/app_library.dart';

class GetSMSStatusParams {
  final String smsId;

  const GetSMSStatusParams({required this.smsId});
}

class GetSMSStatusUseCase extends UseCase<NotificationEntity, GetSMSStatusParams> {
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  GetSMSStatusUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, NotificationEntity>> call(GetSMSStatusParams params) async {
    try {
      final status = await smsNotificationRepository.getSMSStatus(params.smsId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get SMS status'));
    }
  }
}
