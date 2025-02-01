part of use_case;

/// Doc Required
class SetTwoFactorAuthenticationParams {
  /// Doc Required
  SetTwoFactorAuthenticationParams({
    required this.userId,
    required this.enabled,
  });

  /// Doc Required

  final String userId;

  /// Doc Required

  final bool enabled;
}

/// Doc Required
class SetTwoFactorAuthenticationUseCase
    extends UseCase<void, SetTwoFactorAuthenticationParams> {
  /// Doc Required
  SetTwoFactorAuthenticationUseCase({
    required this.accountSecurityRepository,
  });

  /// Doc Required
  final AccountSecurityRepository<void> accountSecurityRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final SetTwoFactorAuthenticationParams params,
  ) async {
    try {
      await accountSecurityRepository.setTwoFactorAuthentication(
        params.userId,
        enabled: params.enabled,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to set two-factor authentication'),
      );
    }
  }
}
