part of use_case;

/// Doc Required
class UnlinkAccountParams {
  /// Doc Required
  UnlinkAccountParams({required this.userId, required this.accountId});

  /// Doc Required
  final String userId;

  /// Doc Required
  final String accountId;
}

/// Doc Required
class UnlinkAccountUseCase extends UseCase<void, UnlinkAccountParams> {
  /// Doc Required
  UnlinkAccountUseCase({required this.linkedAccountsRepository});

  /// Doc Required
  final LinkedAccountsRepository<void> linkedAccountsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(final UnlinkAccountParams params) async {
    try {
      await linkedAccountsRepository.unlinkAccount(
        params.userId,
        params.accountId,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to unlink account'));
    }
  }
}
