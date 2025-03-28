part of use_case;

/// Doc Required
class IntegrateThirdPartyServiceParams {
  /// Doc Required
  IntegrateThirdPartyServiceParams({
    required this.serviceName,
    required this.config,
  });

  /// Doc Required
  final String serviceName;

  /// Doc Required
  final Map<String, dynamic> config;
}

/// Doc Required
class IntegrateThirdPartyServiceUseCase
    extends UseCase<void, IntegrateThirdPartyServiceParams> {
  /// Doc Required
  IntegrateThirdPartyServiceUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final IntegrateThirdPartyServiceParams params,
  ) async {
    try {
      await notificationRepository.integrateThirdPartyService(
        params.serviceName,
        params.config,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to integrate third-party service'),
      );
    }
  }
}
