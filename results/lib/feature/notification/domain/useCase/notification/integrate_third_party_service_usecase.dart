import 'package:todo_app/core/app_library.dart';

class IntegrateThirdPartyServiceParams {
  IntegrateThirdPartyServiceParams(
      {required this.serviceName, required this.config});
  final String serviceName;
  final Map<String, dynamic> config;
}

class IntegrateThirdPartyServiceUseCase
    extends UseCase<void, IntegrateThirdPartyServiceParams> {
  IntegrateThirdPartyServiceUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final IntegrateThirdPartyServiceParams params) async {
    try {
      await notificationRepository.integrateThirdPartyService(
          params.serviceName, params.config);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to integrate third-party service'));
    }
  }
}
