import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdateUserProfileParams {
  final String userId;
  final Map<String, dynamic> profileData;

  UpdateUserProfileParams({required this.userId, required this.profileData});
}

class UpdateUserProfileUseCase extends UseCase<void, UpdateUserProfileParams> {
  final ProfileRepository<void> profileRepository;

  UpdateUserProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, void>> call(UpdateUserProfileParams params) async {
    try {
      await profileRepository.updateUserProfile(params.userId, params.profileData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update user profile'));
    }
  }
}
