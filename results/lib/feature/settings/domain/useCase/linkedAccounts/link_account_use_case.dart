import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class LinkAccountParams {
  final String userId;
  final Map<String, dynamic> accountDetails;

  LinkAccountParams({required this.userId, required this.accountDetails});
}

class LinkAccountUseCase extends UseCase<void, LinkAccountParams> {
  final LinkedAccountsRepository<void> linkedAccountsRepository;

  LinkAccountUseCase({required this.linkedAccountsRepository});

  @override
  Future<Either<Failure, void>> call(LinkAccountParams params) async {
    try {
      await linkedAccountsRepository.linkAccount(params.userId, params.accountDetails);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to link account'));
    }
  }
}
