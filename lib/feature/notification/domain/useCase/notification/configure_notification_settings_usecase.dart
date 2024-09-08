import 'package:todo_app/core/app_library.dart';

class ConfigureNotificationSettingsParams {
  final String userId;
  final Map<String, dynamic> settings;

  ConfigureNotificationSettingsParams({required this.userId, required this.settings});
}

class ConfigureNotificationSettingsUseCase extends UseCase<void, ConfigureNotificationSettingsParams> {
  final NotificationRepository notificationRepository;

  ConfigureNotificationSettingsUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(ConfigureNotificationSettingsParams params) async {
    try {
      await notificationRepository.configureNotificationSettings(params.userId, params.settings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to configure notification settings'));
    }
  }
}
