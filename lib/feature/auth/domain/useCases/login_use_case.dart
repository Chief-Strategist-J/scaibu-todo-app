import 'package:todo_app/core/app_library.dart';

class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(Map<String, dynamic> params) async {
    try {
      toast("Logging in...", bgColor: cardColor, length: Toast.LENGTH_SHORT);

      final auth = await authRepository.standardSignIn(params);
      _storeCred(auth);

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
      _storeOnFirebaseResponse(user);

      return Right(auth);
    } on FirebaseAuthException catch (e, s) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;
        default:
          errorMessage = 'Failed to authenticate. Please try again.';
          break;
      }
      toast(errorMessage);
      logService.crashLog(errorMessage: errorMessage, e: e, stack: s);
      return Left(ServerFailure(errorMessage));
    } catch (e, s) {
      toast('An unexpected error occurred. Please try again.');
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Failed to create todo'));
    }
  }

  void _storeCred(LoginEntity auth) {
    userCredentials.box.put(userCredentials.isLogin, true);
    userCredentials.box.put(userCredentials.email, auth.email);
    userCredentials.box.put(userCredentials.id, auth.id);
    userCredentials.box.put(userCredentials.userName, auth.name);
    userCredentials.box.put(userCredentials.accessToken, auth.accessToken);
  }

  void _storeOnFirebaseResponse(UserCredential user) {
    if (user.user != null) {
      userCredentials.box.put(userCredentials.firebasePhotoUrl, user.user?.photoURL);
    }
  }

  void _oneSignalLogin(Map<String, dynamic> params) {
    OneSignal.login(params['email']);
    OneSignal.User.addEmail(params['email']);
    OneSignal.User.addTags({'email': params['email']});
  }
}
