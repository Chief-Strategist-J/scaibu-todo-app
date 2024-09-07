import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

// Temporary concrete class for demonstration
class ConcreteBillingDetails {
  final String billingInfo;

  ConcreteBillingDetails({required this.billingInfo});
}

class UpdateBillingDetailsParams {
  final String userId;
  final Map<String, dynamic> billingDetails;

  UpdateBillingDetailsParams({required this.userId, required this.billingDetails});
}

class UpdateBillingDetailsUseCase extends UseCase<void, UpdateBillingDetailsParams> {
  final BillingAndSubscriptionRepository<void> billingAndSubscriptionRepository;

  UpdateBillingDetailsUseCase({required this.billingAndSubscriptionRepository});

  @override
  Future<Either<Failure, void>> call(UpdateBillingDetailsParams params) async {
    try {
      await billingAndSubscriptionRepository.updateBillingDetails(params.userId, params.billingDetails);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update billing details'));
    }
  }
}
