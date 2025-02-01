part of use_case;

/// Doc Required
class ResetApplicationSettingsUseCase extends UseCase<void, void> {
  /// Doc Required

  ResetApplicationSettingsUseCase({
    required this.applicationSettingsRepository,
  });

  /// Doc Required
  final ApplicationSettingsRepository<void> applicationSettingsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(final void params) async {
    try {
      await applicationSettingsRepository.resetApplicationSettings();
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to reset application settings'),
      );
    }
  }
}
