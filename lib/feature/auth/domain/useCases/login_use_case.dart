part of use_case;

/// Doc Required
class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  /// Doc Required
  LoginUseCase(this.authRepository);

  /// Doc Required
  final AuthRepository authRepository;

  FirebaseAuth get _auth => FirebaseAuth.instance;

  Box<dynamic> get _box => userCredentials.box;

  // Future<void> _oneSignalLogin(final Map<String, dynamic> params) async {
  //   await OneSignal.login(params['email'] as String);
  //   await OneSignal.User.addEmail(params['email'] as String);
  //   await OneSignal.User.addTags(<String, dynamic>
  //   {'email': params['email']});
  // }

  Future<Left<Failure, LoginEntity>> _catchException(
    final Object e,
    final StackTrace s,
  ) async {
    await logService.crashLog(
      errorMessage: 'Failed to login todo',
      e: e,
      stack: s,
    );

    return Left<Failure, LoginEntity>(ServerFailure('Failed to login todo'));
  }

  Future<Left<Failure, LoginEntity>> _catchFireException(
    final FirebaseAuthException e,
    final StackTrace s,
  ) async {
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

    await logService.crashLog(errorMessage: errorMessage, e: e, stack: s);

    return Left<Failure, LoginEntity>(ServerFailure(errorMessage));
  }

  Future<UserCredential> _firebaseSignUpSignIn(
    final Map<String, dynamic> params,
  ) async {
    final String email = params['email'] as String;
    final String password = params['password'] as String;

    return _signUp(email, password).whenComplete(
      () => _signIn(email, password),
    );
  }

  Future<UserCredential> _signUp(
    final String email,
    final String password,
  ) async =>
      _auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> _signIn(final String email, final String password) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<void> _storeCred(final LoginEntity auth) async {
    await _box.put(userCredentials.isLogin, true);
    await _box.put(userCredentials.email, auth.email);
    await _box.put(userCredentials.id, auth.id);
    await _box.put(userCredentials.userName, auth.name);
    await _box.put(userCredentials.accessToken, auth.accessToken);
  }

  Future<void> _storeOnFirebaseResponse(final UserCredential user) async {
    if (user.user != null) {
      await _box.put(
        userCredentials.firebasePhotoUrl,
        user.user?.photoURL ?? '',
      );
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      final LoginEntity auth = await authRepository.standardSignIn(params);

      await _storeCred(auth);

      UserCredential user;
      final String email = params['email'] as String;
      final String password = params['password'] as String;

      if (!auth.isLogin.validate()) {
        user = await _firebaseSignUpSignIn(params);
      } else {
        user = await _signIn(email, password);
      }

      /// await _oneSignalLogin(params);
      await _storeOnFirebaseResponse(user);

      return Right<Failure, LoginEntity>(auth);
    } on FirebaseAuthException catch (e, s) {
      return _catchFireException(e, s);
    } catch (e, s) {
      return _catchException(e, s);
    }
  }
}
