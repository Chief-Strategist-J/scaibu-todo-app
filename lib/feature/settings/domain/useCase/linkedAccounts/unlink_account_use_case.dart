import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UnlinkAccountParams {
  final String userId;
  final String accountId;

  UnlinkAccountParams({required this.userId, required this.accountId});
}

class UnlinkAccountUseCase extends UseCase<void, UnlinkAccountParams> {
  final LinkedAccountsRepository<void> linkedAccountsRepository;

  UnlinkAccountUseCase({required this.linkedAccountsRepository});

  @override
  Future<Either<Failure, void>> call(UnlinkAccountParams params) async {
    try {
      await linkedAccountsRepository.unlinkAccount(params.userId, params.accountId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to unlink account'));
    }
  }
}
