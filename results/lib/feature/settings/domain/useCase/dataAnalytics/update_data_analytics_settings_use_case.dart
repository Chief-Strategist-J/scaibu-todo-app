import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

// Temporary concrete class for demonstration
class ConcreteDataAnalyticsSettings {
  final Map<String, dynamic> settings;

  ConcreteDataAnalyticsSettings({required this.settings});
}

class UpdateDataAnalyticsSettingsParams {
  final String userId;
  final Map<String, dynamic> settings;

  UpdateDataAnalyticsSettingsParams({
    required this.userId,
    required this.settings,
  });
}

class UpdateDataAnalyticsSettingsUseCase extends UseCase<void, UpdateDataAnalyticsSettingsParams> {
  final DataAnalyticsRepository<void> dataAnalyticsRepository;

  UpdateDataAnalyticsSettingsUseCase({
    required this.dataAnalyticsRepository,
  });

  @override
  Future<Either<Failure, void>> call(UpdateDataAnalyticsSettingsParams params) async {
    try {
      await dataAnalyticsRepository.updateDataAnalyticsSettings(params.userId, params.settings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update data analytics settings'));
    }
  }
}
