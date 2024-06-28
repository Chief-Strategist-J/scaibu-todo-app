import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/app_library.dart';

class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(Map<String, dynamic> params) async {
    try {
      final auth = await authRepository.standardSignIn(params);

      UserCredential user;
      if (!auth.isLogin.validate()) {
        user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: params['email'],
          password: params['password'],
        );
      } else {
        user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: params['email'],
          password: params['password'],
        );
      }

      if (user.user != null) userCredentials.box.put(UserCredentials.firebasePhotoUrl, user.user?.photoURL);
      userCredentials.box.put(UserCredentials.email, auth.email);
      userCredentials.box.put(UserCredentials.id, auth.id);
      userCredentials.box.put(UserCredentials.userName, auth.name);
      userCredentials.box.put(UserCredentials.accessToken, auth.accessToken);

      return Right(auth);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Failed to create todo'));
    }
  }
}
