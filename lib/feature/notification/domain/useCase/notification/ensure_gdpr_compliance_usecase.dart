part of use_case;

/// Doc Required
class EnsureGDPRComplianceParams {
  /// Doc Required
  EnsureGDPRComplianceParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class EnsureGDPRComplianceUseCase
    extends UseCase<void, EnsureGDPRComplianceParams> {
  /// Doc Required
  EnsureGDPRComplianceUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final EnsureGDPRComplianceParams params,
  ) async {
    try {
      await notificationRepository.ensureGDPRCompliance(params.userId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to ensure GDPR compliance'),
      );
    }
  }
}
