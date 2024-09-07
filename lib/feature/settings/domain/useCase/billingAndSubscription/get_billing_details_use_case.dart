import 'package:todo_app/core/app_library.dart';


// Temporary concrete class for demonstration
class ConcreteBillingDetails {
  final String billingInfo;

  ConcreteBillingDetails({required this.billingInfo});
}

class GetBillingDetailsUseCase extends UseCase<ConcreteBillingDetails, GetBillingDetailsParams> {
  final BillingAndSubscriptionRepository<ConcreteBillingDetails> billingAndSubscriptionRepository;

  GetBillingDetailsUseCase({
    required this.billingAndSubscriptionRepository,
  });

  @override
  Future<Either<Failure, ConcreteBillingDetails>> call(GetBillingDetailsParams params) async {
    try {
      final details = await billingAndSubscriptionRepository.getBillingDetails(params.userId);
      return Right(details);
    } catch (e) {
      return Left(ServerFailure('Failed to get billing details'));
    }
  }
}

class GetBillingDetailsParams {
  final String userId;

  GetBillingDetailsParams({
    required this.userId,
  });
}
