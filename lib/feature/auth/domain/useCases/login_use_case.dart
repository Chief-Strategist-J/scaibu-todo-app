part of use_case;

/// Doc Required
class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  /// Doc Required
  LoginUseCase(this.authRepository);

  /// Doc Required
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, LoginEntity>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      toast('Logging in...', bgColor: cardColor);

      final LoginEntity auth = await authRepository.standardSignIn(params);
      await _storeCred(auth);

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

      await _oneSignalLogin(params);
      await _storeOnFirebaseResponse(user);

      return Right<Failure, LoginEntity>(auth);
    } on FirebaseAuthException catch (e, s) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
        default:
          errorMessage = 'Failed to authenticate. Please try again.';
      }
      toast(errorMessage);
      await logService.crashLog(errorMessage: errorMessage, e: e, stack: s);
      return Left<Failure, LoginEntity>(ServerFailure(errorMessage));
    } catch (e, s) {
      toast('An unexpected error occurred. Please try again.');
      await logService.crashLog(
        errorMessage: 'Failed to create todo',
        e: e,
        stack: s,
      );
      return Left<Failure, LoginEntity>(ServerFailure('Failed to create todo'));
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
