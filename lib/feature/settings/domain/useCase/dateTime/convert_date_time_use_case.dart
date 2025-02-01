part of use_case;

/// Doc Required
class ConvertDateTimeParams {
  /// Doc Required
  ConvertDateTimeParams({required this.format, required this.dateTime});

  /// Doc Required
  final String format;

  /// Doc Required
  final DateTime dateTime;
}

/// Doc Required
class ConvertDateTimeUseCase extends UseCase<String, ConvertDateTimeParams> {
  /// Doc Required
  ConvertDateTimeUseCase({required this.dateTimeRepository});

  /// Doc Required
  final DateTimeRepository<void> dateTimeRepository;

  /// Doc Required
  @override
  Future<Either<Failure, String>> call(
    final ConvertDateTimeParams params,
  ) async {
    try {
      final String formattedDateTime = await dateTimeRepository.convertDateTime(
        params.format,
        params.dateTime,
      );
      return Right<Failure, String>(formattedDateTime);
    } catch (e) {
      return Left<Failure, String>(
        ServerFailure('Failed to convert date and time'),
      );
    }
  }
}
