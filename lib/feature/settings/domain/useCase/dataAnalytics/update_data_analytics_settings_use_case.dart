part of use_case;

// Temporary concrete class for demonstration
/// Doc Required
class ConcreteDataAnalyticsSettings {
  /// Doc Required
  ConcreteDataAnalyticsSettings({required this.settings});

  /// Doc Required
  final Map<String, dynamic> settings;
}

/// Doc Required
class UpdateDataAnalyticsSettingsParams {
  /// Doc Required
  UpdateDataAnalyticsSettingsParams({
    required this.userId,
    required this.settings,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> settings;
}

/// Doc Required
class UpdateDataAnalyticsSettingsUseCase
    extends UseCase<void, UpdateDataAnalyticsSettingsParams> {
  /// Doc Required
  UpdateDataAnalyticsSettingsUseCase({
    required this.dataAnalyticsRepository,
  });

  /// Doc Required
  final DataAnalyticsRepository<void> dataAnalyticsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateDataAnalyticsSettingsParams params,
  ) async {
    try {
      await dataAnalyticsRepository.updateDataAnalyticsSettings(
        params.userId,
        params.settings,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update data analytics settings'),
      );
    }
  }
}
