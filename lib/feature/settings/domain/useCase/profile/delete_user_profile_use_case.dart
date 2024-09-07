import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class DeleteUserProfileUseCase extends UseCase<void, String> {
  final ProfileRepository<void> profileRepository;

  DeleteUserProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await profileRepository.deleteUserProfile(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete user profile'));
    }
  }
}
