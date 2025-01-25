part of use_case;

/// Doc Required
class GetUserDetailUseCase
    extends UseCase<Either<FailResponse, LoginEntity>, Map<String, dynamic>> {
  /// Doc Required
  GetUserDetailUseCase(this.authRepository);

  /// Doc Required
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, Either<FailResponse, LoginEntity>>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      final accessToken = userCredentials.box.get(userCredentials.accessToken);
      final tokenSavedTime =
          userCredentials.box.get(userCredentials.tokenSavedTime);
      final DateTime currentTime = DateTime.now();

      if (accessToken == null ||
          (tokenSavedTime != null &&
              currentTime.isAfter(
                  tokenSavedTime.add(const Duration(hours: 1)) as DateTime))) {
        final Either<FailResponse, LoginEntity> userResult =
            await authRepository.getUserDetail(params);

        userResult.fold(Left.new, _storeCred);

        return Right<Failure, Either<FailResponse, LoginEntity>>(userResult);
      } else {
        return Right<Failure, Either<FailResponse, LoginEntity>>(
          Right(
            LoginEntity(
              id: userCredentials.box.get(userCredentials.id) as num?,
              email: userCredentials.box.get(userCredentials.email) as String?,
              name:
                  userCredentials.box.get(userCredentials.userName) as String?,
              accessToken: accessToken as String?,
            ),
          ),
        );
      }
    } on Exception catch (_) {
      return Left<Failure, Either<FailResponse, LoginEntity>>(
        ServerFailure('An error occurred'),
      );
    }
  }

  Future<void> _storeCred(final LoginEntity auth) async {
    await userCredentials.box.put(userCredentials.isLogin, true);
    await userCredentials.box.put(userCredentials.email, auth.email);
    await userCredentials.box.put(userCredentials.id, auth.id);
    await userCredentials.box.put(userCredentials.userName, auth.name);
    await userCredentials.box
        .put(userCredentials.accessToken, auth.accessToken);
    await userCredentials.box.put(
      userCredentials.tokenSavedTime,
      DateTime.now(),
    ); // Store the current time
  }
}
