part of use_case;

/// Doc Required
class ConcreteUserProfile {
  /// Doc Required
  ConcreteUserProfile({
    required this.userId,
    required this.name,
    required this.email,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final String name;

  /// Doc Required
  final String email;
}

/// Doc Required
class GetUserProfileUseCase extends UseCase<ConcreteUserProfile, String> {
  /// Doc Required
  GetUserProfileUseCase({required this.profileRepository});

  /// Doc Required
  final ProfileRepository<ConcreteUserProfile> profileRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcreteUserProfile>> call(final String params) async {
    try {
      final ConcreteUserProfile profile =
          await profileRepository.getUserProfile(params);
      return Right<Failure, ConcreteUserProfile>(profile);
    } catch (e) {
      return Left<Failure, ConcreteUserProfile>(
        ServerFailure('Failed to get user profile'),
      );
    }
  }
}
