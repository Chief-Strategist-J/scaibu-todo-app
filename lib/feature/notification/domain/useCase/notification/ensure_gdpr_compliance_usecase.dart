import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class EnsureGDPRComplianceParams {
  final String userId;

  EnsureGDPRComplianceParams({required this.userId});
}

class EnsureGDPRComplianceUseCase
    extends UseCase<void, EnsureGDPRComplianceParams> {
  final NotificationRepository<NotificationEntity> notificationRepository;

  EnsureGDPRComplianceUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(final EnsureGDPRComplianceParams params) async {
    try {
      await notificationRepository.ensureGDPRCompliance(params.userId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to ensure GDPR compliance'));
    }
  }
}
