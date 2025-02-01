import 'package:todo_app/core/app_library.dart';


class Setting {
  //
}

class GetAccountSecuritySettingsParams {
  final String userId;

  GetAccountSecuritySettingsParams({required this.userId});
}

class GetAccountSecuritySettingsUseCase extends UseCase<Setting, GetAccountSecuritySettingsParams> {
  final AccountSecurityRepository accountSecurityRepository;

  GetAccountSecuritySettingsUseCase({required this.accountSecurityRepository});

  @override
  Future<Either<Failure, Setting>> call(GetAccountSecuritySettingsParams params) async {
    try {
      final settings = await accountSecurityRepository.getAccountSecuritySettings(params.userId);
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure('Failed to get account security settings'));
    }
  }
}
