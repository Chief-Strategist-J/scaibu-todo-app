import 'package:todo_app/core/app_library.dart';

class ConcreteUserProfile {
  final String userId;
  final String name;
  final String email;

  ConcreteUserProfile({required this.userId, required this.name, required this.email});
}

class GetUserProfileUseCase extends UseCase<ConcreteUserProfile, String> {
  final ProfileRepository<ConcreteUserProfile> profileRepository;

  GetUserProfileUseCase({required this.profileRepository});

  @override
  Future<Either<Failure, ConcreteUserProfile>> call(String userId) async {
    try {
      final profile = await profileRepository.getUserProfile(userId);
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure('Failed to get user profile'));
    }
  }
}
