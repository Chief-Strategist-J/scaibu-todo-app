import 'package:todo_app/core/app_library.dart';


// Temporary concrete class for demonstration
class ConcreteDataAnalytics {
  final String analyticsInfo;

  ConcreteDataAnalytics({required this.analyticsInfo});
}

class GetDataAnalyticsParams {
  final String userId;

  GetDataAnalyticsParams({required this.userId});
}

class GetDataAnalyticsUseCase extends UseCase<ConcreteDataAnalytics, GetDataAnalyticsParams> {
  final DataAnalyticsRepository<ConcreteDataAnalytics> dataAnalyticsRepository;

  GetDataAnalyticsUseCase({required this.dataAnalyticsRepository});

  @override
  Future<Either<Failure, ConcreteDataAnalytics>> call(GetDataAnalyticsParams params) async {
    try {
      final analytics = await dataAnalyticsRepository.getDataAnalytics(params.userId);
      return Right(analytics);
    } catch (e) {
      return Left(ServerFailure('Failed to get data analytics'));
    }
  }
}
