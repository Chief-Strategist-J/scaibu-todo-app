import 'package:todo_app/core/app_library.dart';

class EnableDoNotDisturbParams {
  final String userId;
  final bool enabled;

  EnableDoNotDisturbParams({required this.userId, required this.enabled});
}

class EnableDoNotDisturbUseCase extends UseCase<void, EnableDoNotDisturbParams> {
  final NotificationRepository notificationRepository;

  EnableDoNotDisturbUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(EnableDoNotDisturbParams params) async {
    try {
      await notificationRepository.enableDoNotDisturb(params.userId, params.enabled);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to enable or disable do not disturb'));
    }
  }
}
