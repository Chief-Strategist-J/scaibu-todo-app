import 'package:todo_app/core/app_library.dart';

// Temporary concrete class for demonstration
class ConcreteLinkedAccount {
  final String accountId;
  final String accountName;

  ConcreteLinkedAccount({required this.accountId, required this.accountName});
}

class GetLinkedAccountsUseCase extends UseCase<List<ConcreteLinkedAccount>, String> {
  final LinkedAccountsRepository<ConcreteLinkedAccount> linkedAccountsRepository;

  GetLinkedAccountsUseCase({required this.linkedAccountsRepository});

  @override
  Future<Either<Failure, List<ConcreteLinkedAccount>>> call(String userId) async {
    try {
      final accounts = await linkedAccountsRepository.getLinkedAccounts(userId);
      return Right(accounts);
    } catch (e) {
      return Left(ServerFailure('Failed to get linked accounts'));
    }
  }
}
