part of use_case;

/// Doc Required
class ConcreteLinkedAccount {
  /// Doc Required

  ConcreteLinkedAccount({required this.accountId, required this.accountName});

  /// Doc Required

  final String accountId;

  /// Doc Required

  final String accountName;
}

/// Doc Required
class GetLinkedAccountsUseCase
    extends UseCase<List<ConcreteLinkedAccount>, String> {
  /// Doc Required

  GetLinkedAccountsUseCase({required this.linkedAccountsRepository});

  /// Doc Required
  final LinkedAccountsRepository<ConcreteLinkedAccount>
      linkedAccountsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, List<ConcreteLinkedAccount>>> call(
    final String params,
  ) async {
    try {
      final List<ConcreteLinkedAccount> accounts =
          await linkedAccountsRepository.getLinkedAccounts(params);
      return Right<Failure, List<ConcreteLinkedAccount>>(accounts);
    } catch (e) {
      return Left<Failure, List<ConcreteLinkedAccount>>(
        ServerFailure('Failed to get linked accounts'),
      );
    }
  }
}
