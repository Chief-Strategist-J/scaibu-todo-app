part of use_case;

/// Doc Required
class ConcreteHistoricalData {
  /// Doc Required
  ConcreteHistoricalData({required this.historicalInfo});

  /// Doc Required
  final String historicalInfo;
}

/// Doc Required
class GetHistoricalDataParams {
  /// Doc Required
  GetHistoricalDataParams({
    required this.userId,
    required this.startDate,
    required this.endDate,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final DateTime startDate;

  /// Doc Required
  final DateTime endDate;
}

/// Doc Required
class GetHistoricalDataUseCase
    extends UseCase<List<ConcreteHistoricalData>, GetHistoricalDataParams> {
  /// Doc Required
  GetHistoricalDataUseCase({
    required this.dataAnalyticsRepository,
  });

  /// Doc Required
  final DataAnalyticsRepository<ConcreteHistoricalData> dataAnalyticsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, List<ConcreteHistoricalData>>> call(
    final GetHistoricalDataParams params,
  ) async {
    try {
      final List<ConcreteHistoricalData> historicalData =
          await dataAnalyticsRepository.getHistoricalData(
        params.userId,
        params.startDate,
        params.endDate,
      );
      return Right<Failure, List<ConcreteHistoricalData>>(historicalData);
    } catch (e) {
      return Left<Failure, List<ConcreteHistoricalData>>(
        ServerFailure('Failed to get historical data'),
      );
    }
  }
}
