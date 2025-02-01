import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

// Temporary concrete class for demonstration
class ConcreteSubscriptionDetails {
  final String subscriptionInfo;

  ConcreteSubscriptionDetails({required this.subscriptionInfo});
}

class GetSubscriptionDetailsParams {
  final String userId;

  GetSubscriptionDetailsParams({required this.userId});
}

class GetSubscriptionDetailsUseCase extends UseCase<ConcreteSubscriptionDetails, GetSubscriptionDetailsParams> {
  final BillingAndSubscriptionRepository<ConcreteSubscriptionDetails> billingAndSubscriptionRepository;

  GetSubscriptionDetailsUseCase({required this.billingAndSubscriptionRepository});

  @override
  Future<Either<Failure, ConcreteSubscriptionDetails>> call(GetSubscriptionDetailsParams params) async {
    try {
      final details = await billingAndSubscriptionRepository.getSubscriptionDetails(params.userId);
      return Right(details);
    } catch (e) {
      return Left(ServerFailure('Failed to get subscription details'));
    }
  }
}
