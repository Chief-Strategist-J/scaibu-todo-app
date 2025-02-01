part of use_case;

// Temporary concrete class for demonstration
/// Doc Required
class ConcreteDataAnalytics {
  /// Doc Required
  ConcreteDataAnalytics({required this.analyticsInfo});

  /// Doc Required
  final String analyticsInfo;
}

/// Doc Required
class GetDataAnalyticsParams {
  /// Doc Required
  GetDataAnalyticsParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetDataAnalyticsUseCase
    extends UseCase<ConcreteDataAnalytics, GetDataAnalyticsParams> {
  /// Doc Required
  GetDataAnalyticsUseCase({required this.dataAnalyticsRepository});

  /// Doc Required
  final DataAnalyticsRepository<ConcreteDataAnalytics> dataAnalyticsRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcreteDataAnalytics>> call(
    final GetDataAnalyticsParams params,
  ) async {
    try {
      final ConcreteDataAnalytics analytics =
          await dataAnalyticsRepository.getDataAnalytics(
        params.userId,
      );
      return Right<Failure, ConcreteDataAnalytics>(analytics);
    } catch (e) {
      return Left<Failure, ConcreteDataAnalytics>(
        ServerFailure('Failed to get data analytics'),
      );
    }
  }
}
