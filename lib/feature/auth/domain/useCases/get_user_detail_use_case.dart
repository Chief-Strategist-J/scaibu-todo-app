import 'package:todo_app/core/app_library.dart';

class GetUserDetailUseCase
    extends UseCase<Either<FailResponse, LoginEntity>, Map<String, dynamic>> {
  GetUserDetailUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, Either<FailResponse, LoginEntity>>> call(
      final Map<String, dynamic> params) async {
    try {
      final accessToken = userCredentials.box.get(userCredentials.accessToken);
      final tokenSavedTime =
          userCredentials.box.get(userCredentials.tokenSavedTime);
      final DateTime currentTime = DateTime.now();

      if (accessToken == null ||
          (tokenSavedTime != null &&
              currentTime
                  .isAfter(tokenSavedTime.add(const Duration(hours: 1))))) {
        final Either<FailResponse, LoginEntity> userResult =
            await authRepository.getUserDetail(params);

        userResult.fold(Left.new, _storeCred);

        return Right(userResult);
      } else {
        return Right(Right(LoginEntity(
          id: userCredentials.box.get(userCredentials.id),
          email: userCredentials.box.get(userCredentials.email),
          name: userCredentials.box.get(userCredentials.userName),
          accessToken: accessToken,
        )));
      }
    } on Exception catch (_) {
      return Left(ServerFailure("An error occurred"));
    }
  }

  Future<void> _storeCred(final LoginEntity auth) async {
    await userCredentials.box.put(userCredentials.isLogin, true);
    await userCredentials.box.put(userCredentials.email, auth.email);
    await userCredentials.box.put(userCredentials.id, auth.id);
    await userCredentials.box.put(userCredentials.userName, auth.name);
    await userCredentials.box
        .put(userCredentials.accessToken, auth.accessToken);
    await userCredentials.box.put(userCredentials.tokenSavedTime,
        DateTime.now()); // Store the current time
  }
}
