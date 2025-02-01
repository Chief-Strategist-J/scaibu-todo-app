import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

// Temporary concrete class for demonstration
class ConcreteHistoricalData {
  final String historicalInfo;

  ConcreteHistoricalData({required this.historicalInfo});
}

class GetHistoricalDataParams {
  final String userId;
  final DateTime startDate;
  final DateTime endDate;

  GetHistoricalDataParams({
    required this.userId,
    required this.startDate,
    required this.endDate,
  });
}

class GetHistoricalDataUseCase extends UseCase<List<ConcreteHistoricalData>, GetHistoricalDataParams> {
  final DataAnalyticsRepository<ConcreteHistoricalData> dataAnalyticsRepository;

  GetHistoricalDataUseCase({
    required this.dataAnalyticsRepository,
  });

  @override
  Future<Either<Failure, List<ConcreteHistoricalData>>> call(GetHistoricalDataParams params) async {
    try {
      final historicalData = await dataAnalyticsRepository.getHistoricalData(
        params.userId,
        params.startDate,
        params.endDate,
      );
      return Right(historicalData);
    } catch (e) {
      return Left(ServerFailure('Failed to get historical data'));
    }
  }
}
