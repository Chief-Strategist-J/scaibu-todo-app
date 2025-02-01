part of use_case;

/// Doc Required
class EnableDoNotDisturbParams {
  /// Doc Required
  EnableDoNotDisturbParams({required this.userId, required this.enabled});

  /// Doc Required
  final String userId;

  /// Doc Required
  final bool enabled;
}

/// Doc Required
class EnableDoNotDisturbUseCase
    extends UseCase<void, EnableDoNotDisturbParams> {
  /// Doc Required
  EnableDoNotDisturbUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final EnableDoNotDisturbParams params,
  ) async {
    try {
      await notificationRepository.enableDoNotDisturb(
        params.userId,
        enabled: params.enabled,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to enable or disable do not disturb'),
      );
    }
  }
}
