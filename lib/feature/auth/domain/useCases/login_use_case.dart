import 'package:todo_app/core/app_library.dart';

class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(Map<String, dynamic> params) async {
    try {
      toast("Logging ...", bgColor: cardColor, length: Toast.LENGTH_SHORT);

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

      _oneSignalLogin(params);
      _storeCred(user, auth);

      return Right(auth);
    } catch (e, s) {
      toast(e.toString());
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Failed to create todo'));
    }
  }

  void _storeCred(UserCredential user, LoginEntity auth) {
    userCredentials.box.put(userCredentials.isLogin, true);

    if (user.user != null) {
      userCredentials.box.put(userCredentials.firebasePhotoUrl, user.user?.photoURL);
    }
    userCredentials.box.put(userCredentials.email, auth.email);
    userCredentials.box.put(userCredentials.id, auth.id);
    userCredentials.box.put(userCredentials.userName, auth.name);
    userCredentials.box.put(userCredentials.accessToken, auth.accessToken);
  }

  void _oneSignalLogin(Map<String, dynamic> params) {
    OneSignal.login(params['email']);
    OneSignal.User.addEmail(params['email']);
    OneSignal.User.addTags({'email': params['email']});
  }
}
