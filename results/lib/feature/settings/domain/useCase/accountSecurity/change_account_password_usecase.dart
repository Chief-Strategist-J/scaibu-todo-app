import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class ChangeAccountPasswordParams {
  final String userId;
  final String newPassword;

  ChangeAccountPasswordParams({required this.userId, required this.newPassword});
}

class ChangeAccountPasswordUseCase extends UseCase<void, ChangeAccountPasswordParams> {
  final AccountSecurityRepository<void> accountSecurityRepository;

  ChangeAccountPasswordUseCase({required this.accountSecurityRepository});

  @override
  Future<Either<Failure, void>> call(ChangeAccountPasswordParams params) async {
    try {
      await accountSecurityRepository.changeAccountPassword(params.userId, params.newPassword);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to change account password'));
    }
  }
}
