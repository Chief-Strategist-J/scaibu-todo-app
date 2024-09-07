import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_repository.dart'; // Adjust import path as necessary

class SetNotificationFrequencyParams {
  final String userId;
  final String frequency;

  SetNotificationFrequencyParams({
    required this.userId,
    required this.frequency,
  });
}

class SetNotificationFrequencyUseCase extends UseCase<void, SetNotificationFrequencyParams> {
  final NotificationRepository notificationRepository;

  SetNotificationFrequencyUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(SetNotificationFrequencyParams params) async {
    try {
      await notificationRepository.setNotificationFrequency(params.userId, params.frequency);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to set notification frequency'));
    }
  }
}
