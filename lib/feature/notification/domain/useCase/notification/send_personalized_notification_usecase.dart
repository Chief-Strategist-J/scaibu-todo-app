part of use_case;

/// Doc Required
class SendPersonalizedNotificationParams {
  /// Doc Required
  SendPersonalizedNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
    required this.personalizationData,
  });

  /// Doc Required
  final String title;

  /// Doc Required
  final String message;

  /// Doc Required
  final dynamic recipient;

  /// Doc Required
  final Map<String, dynamic> personalizationData;
}

/// Doc Required
class SendPersonalizedNotificationUseCase
    extends UseCase<void, SendPersonalizedNotificationParams> {
  /// Doc Required
  SendPersonalizedNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final SendPersonalizedNotificationParams params,
  ) async {
    try {
      await notificationRepository.sendPersonalizedNotification(
        params.title,
        params.message,
        params.recipient as NotificationEntity,
        params.personalizationData,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to send personalized notification'),
      );
    }
  }
}
