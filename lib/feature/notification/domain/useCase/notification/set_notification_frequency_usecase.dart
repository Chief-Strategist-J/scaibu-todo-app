part of use_case;

/// Doc Required
class SetNotificationFrequencyParams {
  /// Doc Required
  SetNotificationFrequencyParams({
    required this.userId,
    required this.frequency,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final String frequency;
}

/// Doc Required
class SetNotificationFrequencyUseCase
    extends UseCase<void, SetNotificationFrequencyParams> {
  /// Doc Required
  SetNotificationFrequencyUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final SetNotificationFrequencyParams params,
  ) async {
    try {
      await notificationRepository.setNotificationFrequency(
        params.userId,
        params.frequency,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to set notification frequency'),
      );
    }
  }
}
