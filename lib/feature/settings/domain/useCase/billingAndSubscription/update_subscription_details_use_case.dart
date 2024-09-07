import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

// Temporary concrete class for demonstration
class ConcreteSubscriptionDetails {
  final String subscriptionInfo;

  ConcreteSubscriptionDetails({required this.subscriptionInfo});
}

class UpdateSubscriptionDetailsParams {
  final String userId;
  final Map<String, dynamic> subscriptionDetails;

  UpdateSubscriptionDetailsParams({required this.userId, required this.subscriptionDetails});
}

class UpdateSubscriptionDetailsUseCase extends UseCase<void, UpdateSubscriptionDetailsParams> {
  final BillingAndSubscriptionRepository<void> billingAndSubscriptionRepository;

  UpdateSubscriptionDetailsUseCase({
    required this.billingAndSubscriptionRepository,
  });

  @override
  Future<Either<Failure, void>> call(UpdateSubscriptionDetailsParams params) async {
    try {
      await billingAndSubscriptionRepository.updateSubscriptionDetails(params.userId, params.subscriptionDetails);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update subscription details'));
    }
  }
}
