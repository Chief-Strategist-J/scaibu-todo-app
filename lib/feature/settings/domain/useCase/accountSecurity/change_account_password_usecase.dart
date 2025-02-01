part of use_case;

/// Doc Required
class ChangeAccountPasswordParams {
  /// Doc Required
  ChangeAccountPasswordParams({
    required this.userId,
    required this.newPassword,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final String newPassword;
}

/// Doc Required
class ChangeAccountPasswordUseCase
    extends UseCase<void, ChangeAccountPasswordParams> {
  /// Doc Required
  ChangeAccountPasswordUseCase({required this.accountSecurityRepository});

  /// Doc Required
  final AccountSecurityRepository<void> accountSecurityRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final ChangeAccountPasswordParams params,
  ) async {
    try {
      await accountSecurityRepository.changeAccountPassword(
        params.userId,
        params.newPassword,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to change account password'),
      );
    }
  }
}
