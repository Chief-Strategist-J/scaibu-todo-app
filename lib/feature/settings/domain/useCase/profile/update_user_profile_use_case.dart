part of use_case;

/// Doc Required

class UpdateUserProfileParams {
  /// Doc Required

  UpdateUserProfileParams({required this.userId, required this.profileData});

  /// Doc Required

  final String userId;

  /// Doc Required

  final Map<String, dynamic> profileData;
}

/// Doc Required

class UpdateUserProfileUseCase extends UseCase<void, UpdateUserProfileParams> {
  /// Doc Required

  UpdateUserProfileUseCase({required this.profileRepository});

  /// Doc Required

  final ProfileRepository<void> profileRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateUserProfileParams params,
  ) async {
    try {
      await profileRepository.updateUserProfile(
        params.userId,
        params.profileData,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update user profile'),
      );
    }
  }
}
