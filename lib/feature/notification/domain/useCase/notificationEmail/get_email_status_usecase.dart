part of use_case;

/// Doc Required
/// Doc Required
class GetEmailStatusParams {
  /// Doc Required
  GetEmailStatusParams({required this.emailId});

  /// Doc Required
  final String emailId;
}

/// Doc Required
/// Doc Required
class GetEmailStatusUseCase
    extends UseCase<NotificationEntity, GetEmailStatusParams> {
  /// Doc Required
  GetEmailStatusUseCase({required this.emailNotificationRepository});

  /// Doc Required
  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
    final GetEmailStatusParams params,
  ) async {
    try {
      final NotificationEntity status =
          await emailNotificationRepository.getEmailStatus(params.emailId);

      return Right<Failure, NotificationEntity>(status);
    } catch (e) {
      return Left<Failure, NotificationEntity>(
        ServerFailure('Failed to get email status'),
      );
    }
  }
}
