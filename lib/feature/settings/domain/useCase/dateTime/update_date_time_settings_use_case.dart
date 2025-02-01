part of use_case;

/// Doc Required
class UpdateDateTimeSettingsParams {
  /// Doc Required
  UpdateDateTimeSettingsParams({required this.settings});

  /// Doc Required

  final Map<String, dynamic> settings;
}

/// Doc Required
class UpdateDateTimeSettingsUseCase
    extends UseCase<void, UpdateDateTimeSettingsParams> {
  /// Doc Required

  UpdateDateTimeSettingsUseCase({required this.dateTimeRepository});

  /// Doc Required

  final DateTimeRepository<void> dateTimeRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateDateTimeSettingsParams params,
  ) async {
    try {
      await dateTimeRepository.updateDateTimeSettings(params.settings);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update date and time settings'),
      );
    }
  }
}
