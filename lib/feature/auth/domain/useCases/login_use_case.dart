import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/data/dataSource/local/user_credentials.dart';

class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(Map<String, dynamic> params) async {
    try {
      final auth = await authRepository.standardSignIn(params);

      Box<dynamic> box = await UserCredentials.getUserBox;

      box.put(UserCredentials.email, auth.email);
      box.put(UserCredentials.email, auth.id);
      box.put(UserCredentials.userName, auth.name);
      box.put(UserCredentials.accessToken, auth.accessToken);

      return Right(auth);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Failed to create todo'));
    }
  }
}
