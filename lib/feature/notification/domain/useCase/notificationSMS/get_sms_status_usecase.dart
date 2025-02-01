part of use_case;

/// Doc Required
class GetSMSStatusParams {
  /// Doc Required
  const GetSMSStatusParams({required this.smsId});

  /// Doc Required
  final String smsId;
}

/// Doc Required
class GetSMSStatusUseCase
    extends UseCase<NotificationEntity, GetSMSStatusParams> {
  /// Doc Required
  GetSMSStatusUseCase({required this.smsNotificationRepository});

  /// Doc Required
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
    /// Doc Required
    final GetSMSStatusParams params,
  ) async {
    try {
      /// Doc Required
      final NotificationEntity status =
          await smsNotificationRepository.getSMSStatus(params.smsId);

      return Right<Failure, NotificationEntity>(status);
    } catch (e) {
      return Left<Failure, NotificationEntity>(
        ServerFailure('Failed to get SMS status'),
      );
    }
  }
}
