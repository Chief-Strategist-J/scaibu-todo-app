part of use_case;

/// Doc Required
class Setting {
  //
}

/// Doc Required
class GetAccountSecuritySettingsParams {
  /// Doc Required
  GetAccountSecuritySettingsParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetAccountSecuritySettingsUseCase
    extends UseCase<Setting, GetAccountSecuritySettingsParams> {
  /// Doc Required
  GetAccountSecuritySettingsUseCase({required this.accountSecurityRepository});

  /// Doc Required
  final AccountSecurityRepository<dynamic> accountSecurityRepository;

  /// Doc Required
  @override
  Future<Either<Failure, Setting>> call(
    final GetAccountSecuritySettingsParams params,
  ) async {
    try {
      final Setting settings = await accountSecurityRepository
          .getAccountSecuritySettings(params.userId) as Setting;
      return Right<Failure, Setting>(settings);
    } catch (e) {
      return Left<Failure, Setting>(
        ServerFailure('Failed to get account security settings'),
      );
    }
  }
}
