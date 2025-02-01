import 'package:todo_app/core/app_library.dart';

class Setting{
  //
}
class GetApplicationSettingsUseCase extends UseCase<Setting, void> {
  final ApplicationSettingsRepository<Setting> applicationSettingsRepository;

  GetApplicationSettingsUseCase({
    required this.applicationSettingsRepository,
  });

  @override
  Future<Either<Failure, Setting>> call(void params) async {
    try {
      final settings = await applicationSettingsRepository.getApplicationSettings();
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure('Failed to get application settings'));
    }
  }
}
