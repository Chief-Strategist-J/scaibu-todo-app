part of use_case;

/// Doc Required
class Appearance {
  //
}

/// Doc Required
class GetAppAppearanceSettingsUseCase extends UseCase<Appearance, void> {
  /// Doc Required
  GetAppAppearanceSettingsUseCase({required this.appAppearanceRepository});

  /// Doc Required
  final AppAppearanceRepository<Appearance> appAppearanceRepository;

  /// Doc Required
  @override
  Future<Either<Failure, Appearance>> call(final void params) async {
    try {
      final Appearance settings =
          await appAppearanceRepository.getAppAppearanceSettings();

      return Right<Failure, Appearance>(settings);
    } catch (e) {
      return Left<Failure, Appearance>(
        ServerFailure('Failed to get app appearance settings'),
      );
    }
  }
}
