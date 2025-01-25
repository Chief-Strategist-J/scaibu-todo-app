part of use_case;

class StandardLogoutUseCase extends UseCase<void, Map<String, dynamic>> {

  StandardLogoutUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(final Map<String, dynamic>  params) async {
    try {
      await authRepository.standardLogOut(params);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure('$e'));
    }
  }
}
