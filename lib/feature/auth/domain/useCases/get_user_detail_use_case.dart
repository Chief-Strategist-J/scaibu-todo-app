import 'package:todo_app/core/app_library.dart';

class GetUserDetailUseCase extends UseCase<Either<FailResponse, LoginEntity>, Map<String, dynamic>> {
  final AuthRepository authRepository;

  GetUserDetailUseCase(this.authRepository);

  @override
  Future<Either<Failure, Either<FailResponse, LoginEntity>>> call(Map<String, dynamic> params) async {
    try {
      final user = await authRepository.getUserDetail(params);
      user.fold((l) {}, (r) => _storeCred(r));
      return Right(user);
    } on Exception catch (_) {
      return Left(ServerFailure(errorMessage));
    }
  }

  void _storeCred(LoginEntity auth) {
    userCredentials.box.put(userCredentials.isLogin, true);
    userCredentials.box.put(userCredentials.email, auth.email);
    userCredentials.box.put(userCredentials.id, auth.id);
    userCredentials.box.put(userCredentials.userName, auth.name);
    userCredentials.box.put(userCredentials.accessToken, auth.accessToken);
  }
}
