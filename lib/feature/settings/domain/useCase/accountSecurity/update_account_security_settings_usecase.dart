part of use_case;

/// Doc Required
class UpdateAccountSecuritySettingsParams {
  /// Doc Required
  UpdateAccountSecuritySettingsParams({
    required this.userId,
    required this.securitySettings,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> securitySettings;
}

/// Doc Required
class UpdateAccountSecuritySettingsUseCase
    extends UseCase<void, UpdateAccountSecuritySettingsParams> {
  /// Doc Required
  UpdateAccountSecuritySettingsUseCase({
    required this.accountSecurityRepository,
  });

  /// Doc Required
  final AccountSecurityRepository<void> accountSecurityRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateAccountSecuritySettingsParams params,
  ) async {
    try {
      await accountSecurityRepository.updateAccountSecuritySettings(
        params.userId,
        params.securitySettings,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update account security settings'),
      );
    }
  }
}
