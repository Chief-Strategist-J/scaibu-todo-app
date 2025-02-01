part of use_case;

/// Doc Required
class GetApplicationSettingsUseCase extends UseCase<Setting, void> {
  /// Doc Required
  GetApplicationSettingsUseCase({
    required this.applicationSettingsRepository,
  });

  /// Doc Required
  final ApplicationSettingsRepository<Setting> applicationSettingsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, Setting>> call(final void params) async {
    try {
      final Setting settings =
          await applicationSettingsRepository.getApplicationSettings();
      return Right<Failure, Setting>(settings);
    } catch (e) {
      return Left<Failure, Setting>(
        ServerFailure('Failed to get application settings'),
      );
    }
  }
}
