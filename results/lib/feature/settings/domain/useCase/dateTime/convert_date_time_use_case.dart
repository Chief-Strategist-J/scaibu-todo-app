import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class ConvertDateTimeParams {
  final String format;
  final DateTime dateTime;

  ConvertDateTimeParams({required this.format, required this.dateTime});
}

class ConvertDateTimeUseCase extends UseCase<String, ConvertDateTimeParams> {
  final DateTimeRepository<void> dateTimeRepository;

  ConvertDateTimeUseCase({required this.dateTimeRepository});

  @override
  Future<Either<Failure, String>> call(ConvertDateTimeParams params) async {
    try {
      final formattedDateTime = await dateTimeRepository.convertDateTime(params.format, params.dateTime);
      return Right(formattedDateTime);
    } catch (e) {
      return Left(ServerFailure('Failed to convert date and time'));
    }
  }
}
