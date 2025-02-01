import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdateAccountSecuritySettingsParams {
  final String userId;
  final Map<String, dynamic> securitySettings;

  UpdateAccountSecuritySettingsParams({
    required this.userId,
    required this.securitySettings,
  });
}

class UpdateAccountSecuritySettingsUseCase extends UseCase<void, UpdateAccountSecuritySettingsParams> {
  final AccountSecurityRepository<void> accountSecurityRepository;

  UpdateAccountSecuritySettingsUseCase({required this.accountSecurityRepository});

  @override
  Future<Either<Failure, void>> call(UpdateAccountSecuritySettingsParams params) async {
    try {
      await accountSecurityRepository.updateAccountSecuritySettings(params.userId, params.securitySettings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update account security settings'));
    }
  }
}
