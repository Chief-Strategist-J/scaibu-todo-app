part of use_case;

/// Doc Required
class DeleteUserProfileUseCase extends UseCase<void, String> {
  /// Doc Required
  DeleteUserProfileUseCase({required this.profileRepository});

  /// Doc Required
  final ProfileRepository<void> profileRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await profileRepository.deleteUserProfile(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to delete user profile'),
      );
    }
  }
}
