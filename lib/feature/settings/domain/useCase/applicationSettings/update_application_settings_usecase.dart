import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdateApplicationSettingsUseCase extends UseCase<void, UpdateApplicationSettingsParams> {
  final ApplicationSettingsRepository<void> applicationSettingsRepository;

  UpdateApplicationSettingsUseCase({required this.applicationSettingsRepository});

  @override
  Future<Either<Failure, void>> call(UpdateApplicationSettingsParams params) async {
    try {
      await applicationSettingsRepository.updateApplicationSettings(params.settings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update application settings'));
    }
  }
}

class UpdateApplicationSettingsParams {
  final Map<String, dynamic> settings;

  UpdateApplicationSettingsParams({required this.settings});
}
