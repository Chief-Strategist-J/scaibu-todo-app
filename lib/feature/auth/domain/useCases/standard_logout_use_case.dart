part of use_case;

/// Doc Required
class StandardLogoutUseCase extends UseCase<void, Map<String, dynamic>> {
  /// Doc Required
  StandardLogoutUseCase(this.authRepository);

  /// Doc Required
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(final Map<String, dynamic> params) async {
    try {
      await authRepository.standardLogOut(params);
      return const Right<Failure, void>(null);
    } on Exception catch (e) {
      return Left<Failure, void>(ServerFailure('$e'));
    }
  }
}
