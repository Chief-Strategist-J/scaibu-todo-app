import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdateDateTimeSettingsParams {
  final Map<String, dynamic> settings;

  UpdateDateTimeSettingsParams({required this.settings});
}

class UpdateDateTimeSettingsUseCase extends UseCase<void, UpdateDateTimeSettingsParams> {
  final DateTimeRepository<void> dateTimeRepository;

  UpdateDateTimeSettingsUseCase({required this.dateTimeRepository});

  @override
  Future<Either<Failure, void>> call(UpdateDateTimeSettingsParams params) async {
    try {
      await dateTimeRepository.updateDateTimeSettings(params.settings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update date and time settings'));
    }
  }
}
