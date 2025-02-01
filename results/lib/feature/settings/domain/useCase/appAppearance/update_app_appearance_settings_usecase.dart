import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdateAppAppearanceSettingsParams {
  final Map<String, dynamic> appearanceSettings;

  UpdateAppAppearanceSettingsParams({required this.appearanceSettings});
}

class UpdateAppAppearanceSettingsUseCase extends UseCase<void, UpdateAppAppearanceSettingsParams> {
  final AppAppearanceRepository<void> appAppearanceRepository;

  UpdateAppAppearanceSettingsUseCase({required this.appAppearanceRepository});

  @override
  Future<Either<Failure, void>> call(UpdateAppAppearanceSettingsParams params) async {
    try {
      await appAppearanceRepository.updateAppAppearanceSettings(params.appearanceSettings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update app appearance settings'));
    }
  }
}
