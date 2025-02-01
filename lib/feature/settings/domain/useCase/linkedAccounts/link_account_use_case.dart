part of use_case;

/// Doc Required
class LinkAccountParams {
  /// Doc Required
  LinkAccountParams({required this.userId, required this.accountDetails});

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> accountDetails;
}

/// Doc Required
class LinkAccountUseCase extends UseCase<void, LinkAccountParams> {
  /// Doc Required
  LinkAccountUseCase({required this.linkedAccountsRepository});

  /// Doc Required
  final LinkedAccountsRepository<void> linkedAccountsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(final LinkAccountParams params) async {
    try {
      await linkedAccountsRepository.linkAccount(
        params.userId,
        params.accountDetails,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to link account'));
    }
  }
}
