import 'package:todo_app/core/app_library.dart';

class StandardLogoutUseCase extends UseCase<void, Map<String, dynamic>> {
  final AuthRepository authRepository;

  StandardLogoutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic>  params) async {
    try {
      await authRepository.standardLogOut(params);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure('$e'));
    }
  }
}
