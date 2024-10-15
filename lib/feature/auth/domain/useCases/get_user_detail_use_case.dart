import 'package:todo_app/core/app_library.dart';

class GetUserDetailUseCase extends UseCase<Either<FailResponse, LoginEntity>, Map<String, dynamic>> {
  final AuthRepository authRepository;

  GetUserDetailUseCase(this.authRepository);

  @override
  Future<Either<Failure, Either<FailResponse, LoginEntity>>> call(Map<String, dynamic> params) async {
    try {
      final accessToken = userCredentials.box.get(userCredentials.accessToken);
      final tokenSavedTime = userCredentials.box.get(userCredentials.tokenSavedTime);
      final currentTime = DateTime.now();

      if (accessToken == null || (tokenSavedTime != null && currentTime.isAfter(tokenSavedTime.add(const Duration(hours: 1))))) {
        final userResult = await authRepository.getUserDetail(params);

        userResult.fold((l) => Left(l), (r) => _storeCred(r));

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

  void _storeCred(LoginEntity auth) {
    userCredentials.box.put(userCredentials.isLogin, true);
    userCredentials.box.put(userCredentials.email, auth.email);
    userCredentials.box.put(userCredentials.id, auth.id);
    userCredentials.box.put(userCredentials.userName, auth.name);
    userCredentials.box.put(userCredentials.accessToken, auth.accessToken);
    userCredentials.box.put(userCredentials.tokenSavedTime, DateTime.now()); // Store the current time
  }
}
