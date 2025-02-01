import 'package:todo_app/core/app_library.dart';


// Temporary concrete class for demonstration
class ConcreteDateTimeSettings {
  final String timeZone;
  final String dateFormat;

  ConcreteDateTimeSettings({
    required this.timeZone,
    required this.dateFormat,
  });
}

class GetDateTimeSettingsUseCase extends UseCase<ConcreteDateTimeSettings, void> {
  final DateTimeRepository<ConcreteDateTimeSettings> dateTimeRepository;

  GetDateTimeSettingsUseCase({
    required this.dateTimeRepository,
  });

  @override
  Future<Either<Failure, ConcreteDateTimeSettings>> call(void params) async {
    try {
      final settings = await dateTimeRepository.getDateTimeSettings();
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure('Failed to get date and time settings'));
    }
  }
}
