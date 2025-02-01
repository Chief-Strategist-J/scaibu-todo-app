import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class SetTwoFactorAuthenticationParams {
  final String userId;
  final bool enabled;

  SetTwoFactorAuthenticationParams({required this.userId, required this.enabled});
}

class SetTwoFactorAuthenticationUseCase extends UseCase<void, SetTwoFactorAuthenticationParams> {
  final AccountSecurityRepository<void> accountSecurityRepository;

  SetTwoFactorAuthenticationUseCase({
    required this.accountSecurityRepository,
  });

  @override
  Future<Either<Failure, void>> call(SetTwoFactorAuthenticationParams params) async {
    try {
      await accountSecurityRepository.setTwoFactorAuthentication(params.userId, params.enabled);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to set two-factor authentication'));
    }
  }
}
