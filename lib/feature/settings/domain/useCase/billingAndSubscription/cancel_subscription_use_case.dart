part of use_case;

/// Doc Required
class CancelSubscriptionParams {
  /// Doc Required
  CancelSubscriptionParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class CancelSubscriptionUseCase
    extends UseCase<void, CancelSubscriptionParams> {
  /// Doc Required
  CancelSubscriptionUseCase({required this.billingAndSubscriptionRepository});

  /// Doc Required
  final BillingAndSubscriptionRepository<void> billingAndSubscriptionRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final CancelSubscriptionParams params,
  ) async {
    try {
      await billingAndSubscriptionRepository.cancelSubscription(params.userId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to cancel subscription'),
      );
    }
  }
}
