part of use_case;

/// Doc Required
class UpdateApplicationSettingsUseCase
    extends UseCase<void, UpdateApplicationSettingsParams> {
  /// Doc Required
  UpdateApplicationSettingsUseCase({
    required this.applicationSettingsRepository,
  });

  /// Doc Required
  final ApplicationSettingsRepository<void> applicationSettingsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateApplicationSettingsParams params,
  ) async {
    try {
      await applicationSettingsRepository.updateApplicationSettings(
        params.settings,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update application settings'),
      );
    }
  }
}

/// Doc Required
class UpdateApplicationSettingsParams {
  /// Doc Required
  UpdateApplicationSettingsParams({required this.settings});

  /// Doc Required
  final Map<String, dynamic> settings;
}
