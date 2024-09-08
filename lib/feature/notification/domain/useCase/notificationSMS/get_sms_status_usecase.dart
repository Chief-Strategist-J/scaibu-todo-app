import 'package:todo_app/core/app_library.dart';

class GetSMSStatusParams {
  final String smsId;

  GetSMSStatusParams({required this.smsId});
}

class SMSNotification{}

class GetSMSStatusUseCase extends UseCase<SMSNotification, GetSMSStatusParams> {
  final SMSNotificationRepository<SMSNotification> smsNotificationRepository;

  GetSMSStatusUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, SMSNotification>> call(GetSMSStatusParams params) async {
    try {
      final status = await smsNotificationRepository.getSMSStatus(params.smsId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get SMS status'));
    }
  }
}
