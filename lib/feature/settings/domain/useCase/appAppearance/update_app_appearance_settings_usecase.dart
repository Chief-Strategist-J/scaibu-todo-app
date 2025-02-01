part of use_case;

/// Doc Required
class UpdateAppAppearanceSettingsParams {
  /// Doc Required
  UpdateAppAppearanceSettingsParams({required this.appearanceSettings});

  /// Doc Required
  final Map<String, dynamic> appearanceSettings;
}

/// Doc Required
class UpdateAppAppearanceSettingsUseCase
    extends UseCase<void, UpdateAppAppearanceSettingsParams> {
  /// Doc Required
  UpdateAppAppearanceSettingsUseCase({required this.appAppearanceRepository});

  /// Doc Required
  final AppAppearanceRepository<void> appAppearanceRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateAppAppearanceSettingsParams params,
  ) async {
    try {
      await appAppearanceRepository.updateAppAppearanceSettings(
        params.appearanceSettings,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update app appearance settings'),
      );
    }
  }
}
