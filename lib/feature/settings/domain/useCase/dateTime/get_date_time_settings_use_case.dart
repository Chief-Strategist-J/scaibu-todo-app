part of use_case;

// Temporary concrete class for demonstration
/// Doc Required
class ConcreteDateTimeSettings {
  /// Doc Required
  ConcreteDateTimeSettings({
    required this.timeZone,
    required this.dateFormat,
  });

  /// Doc Required
  final String timeZone;

  /// Doc Required
  final String dateFormat;
}

/// Doc Required
class GetDateTimeSettingsUseCase
    extends UseCase<ConcreteDateTimeSettings, void> {
  /// Doc Required
  GetDateTimeSettingsUseCase({
    required this.dateTimeRepository,
  });

  /// Doc Required
  final DateTimeRepository<ConcreteDateTimeSettings> dateTimeRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcreteDateTimeSettings>> call(
    final void params,
  ) async {
    try {
      final ConcreteDateTimeSettings settings =
          await dateTimeRepository.getDateTimeSettings();
      return Right<Failure, ConcreteDateTimeSettings>(settings);
    } catch (e) {
      return Left<Failure, ConcreteDateTimeSettings>(
        ServerFailure('Failed to get date and time settings'),
      );
    }
  }
}
