import 'package:todo_app/core/app_library.dart';

class CancelSubscriptionParams {
  final String userId;
  CancelSubscriptionParams({required this.userId});
}

class CancelSubscriptionUseCase extends UseCase<void, CancelSubscriptionParams> {
  final BillingAndSubscriptionRepository<void> billingAndSubscriptionRepository;

  CancelSubscriptionUseCase({required this.billingAndSubscriptionRepository});

  @override
  Future<Either<Failure, void>> call(CancelSubscriptionParams params) async {
    try {
      await billingAndSubscriptionRepository.cancelSubscription(params.userId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel subscription'));
    }
  }
}
