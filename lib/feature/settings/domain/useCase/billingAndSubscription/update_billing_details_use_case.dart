part of use_case;

/// Doc Required
class UpdateBillingDetailsParams {
  /// Doc Required
  UpdateBillingDetailsParams({
    required this.userId,
    required this.billingDetails,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> billingDetails;
}

/// Doc Required
class UpdateBillingDetailsUseCase
    extends UseCase<void, UpdateBillingDetailsParams> {
  /// Doc Required
  UpdateBillingDetailsUseCase({required this.billingAndSubscriptionRepository});

  /// Doc Required
  final BillingAndSubscriptionRepository<void> billingAndSubscriptionRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdateBillingDetailsParams params,
  ) async {
    try {
      await billingAndSubscriptionRepository.updateBillingDetails(
        params.userId,
        params.billingDetails,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update billing details'),
      );
    }
  }
}
