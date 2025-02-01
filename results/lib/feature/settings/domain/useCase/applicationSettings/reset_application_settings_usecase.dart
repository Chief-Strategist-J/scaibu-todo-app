import 'package:todo_app/core/app_library.dart';

class ResetApplicationSettingsUseCase extends UseCase<void, void> {
  final ApplicationSettingsRepository<void> applicationSettingsRepository;

  ResetApplicationSettingsUseCase({required this.applicationSettingsRepository});

  @override
  Future<Either<Failure, void>> call(void params) async {
    try {
      await applicationSettingsRepository.resetApplicationSettings();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to reset application settings'));
    }
  }
}
