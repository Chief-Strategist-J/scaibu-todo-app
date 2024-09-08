import 'package:todo_app/core/app_library.dart';

class IntegrateThirdPartyServiceParams {
  final String serviceName;
  final Map<String, dynamic> config;

  IntegrateThirdPartyServiceParams({required this.serviceName, required this.config});
}

class IntegrateThirdPartyServiceUseCase extends UseCase<void, IntegrateThirdPartyServiceParams> {
  final NotificationRepository notificationRepository;

  IntegrateThirdPartyServiceUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(IntegrateThirdPartyServiceParams params) async {
    try {
      await notificationRepository.integrateThirdPartyService(params.serviceName, params.config);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to integrate third-party service'));
    }
  }
}
