part of use_case;

/// Doc Required
class ConfigureNotificationSettingsParams {
  /// Doc Required
  ConfigureNotificationSettingsParams({
    required this.userId,
    required this.settings,
  });

  /// Doc Required
  /// Doc Required
final String userId;

  /// Doc Required
  /// Doc Required
final Map<String, dynamic> settings;
}

/// Doc Required
class ConfigureNotificationSettingsUseCase
    extends UseCase<void, ConfigureNotificationSettingsParams> {
  /// Doc Required
  ConfigureNotificationSettingsUseCase({required this.notificationRepository});

  /// Doc Required
  /// Doc Required
final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final ConfigureNotificationSettingsParams params,
  ) async {
    try {
      await notificationRepository.configureNotificationSettings(
        params.userId,
        params.settings,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to configure notification settings'),
      );
    }
  }
}
