part of use_case;

class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(
      final Map<String, dynamic> params) async {
    try {
      toast('Logging in...', bgColor: cardColor);

      final auth = await authRepository.standardSignIn(params);
      _storeCred(auth);

      UserCredential user;
      if (!auth.isLogin.validate()) {
        user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: params['email'] as String,
          password: params['password'] as String,
        );
      } else {
        user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: params['email'] as String,
          password: params['password'] as String,
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
      await logService.crashLog(errorMessage: errorMessage, e: e, stack: s);
      return Left(ServerFailure(errorMessage));
    } catch (e, s) {
      toast('An unexpected error occurred. Please try again.');
      await logService.crashLog(
        errorMessage: 'Failed to create todo',
        e: e,
        stack: s,
      );
      return Left(ServerFailure('Failed to create todo'));
    }
  }

  Future<void> _storeCred(final LoginEntity auth) async {
    await userCredentials.box.put(userCredentials.isLogin, true);
    await userCredentials.box.put(userCredentials.email, auth.email);
    await userCredentials.box.put(userCredentials.id, auth.id);
    await userCredentials.box.put(userCredentials.userName, auth.name);
    await userCredentials.box
        .put(userCredentials.accessToken, auth.accessToken);
  }

  Future<void> _storeOnFirebaseResponse(final UserCredential user) async {
    if (user.user != null) {
      await userCredentials.box
          .put(userCredentials.firebasePhotoUrl, user.user?.photoURL);
    }
  }

  Future<void> _oneSignalLogin(final Map<String, dynamic> params) async {
    await OneSignal.login(params['email'] as String);
    await OneSignal.User.addEmail(params['email'] as String);
    await OneSignal.User.addTags(<String, dynamic>{'email': params['email']});
  }
}
