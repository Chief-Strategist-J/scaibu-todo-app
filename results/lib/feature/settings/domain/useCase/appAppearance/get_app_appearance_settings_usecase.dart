import 'package:todo_app/core/app_library.dart';

class Appearance {
  //
}

class GetAppAppearanceSettingsUseCase extends UseCase<Appearance, void> {
  final AppAppearanceRepository<Appearance> appAppearanceRepository;

  GetAppAppearanceSettingsUseCase({required this.appAppearanceRepository});

  @override
  Future<Either<Failure, Appearance>> call(void params) async {
    try {
      final settings = await appAppearanceRepository.getAppAppearanceSettings();
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure('Failed to get app appearance settings'));
    }
  }
}
