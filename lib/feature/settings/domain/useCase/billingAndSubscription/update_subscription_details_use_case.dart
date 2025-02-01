part of use_case;

/// Doc Required
class UpdateSubscriptionDetailsParams {
  /// Doc Required
  UpdateSubscriptionDetailsParams({
    required this.userId,
    required this.subscriptionDetails,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> subscriptionDetails;
}

/// Doc Required
class UpdateSubscriptionDetailsUseCase
    extends UseCase<void, UpdateSubscriptionDetailsParams> {
  /// Doc Required
  UpdateSubscriptionDetailsUseCase({
    required this.billingAndSubscriptionRepository,
  });

  /// Doc Required
  final BillingAndSubscriptionRepository<void> billingAndSubscriptionRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateSubscriptionDetailsParams params,
  ) async {
    try {
      await billingAndSubscriptionRepository.updateSubscriptionDetails(
        params.userId,
        params.subscriptionDetails,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update subscription details'),
      );
    }
  }
}
