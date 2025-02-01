part of use_case;

// Temporary concrete /// Doc Required

/// Doc Required
class ConcreteBillingDetails {
  /// Doc Required
  ConcreteBillingDetails({required this.billingInfo});

  /// Doc Required
  final String billingInfo;
}

/// Doc Required
class GetBillingDetailsUseCase
    extends UseCase<ConcreteBillingDetails, GetBillingDetailsParams> {
  /// Doc Required
  GetBillingDetailsUseCase({
    required this.billingAndSubscriptionRepository,
  });

  /// Doc Required
  final BillingAndSubscriptionRepository<ConcreteBillingDetails>
      billingAndSubscriptionRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcreteBillingDetails>> call(
    final GetBillingDetailsParams params,
  ) async {
    try {
      final ConcreteBillingDetails details =
          await billingAndSubscriptionRepository
              .getBillingDetails(params.userId);
      return Right<Failure, ConcreteBillingDetails>(details);
    } catch (e) {
      return Left<Failure, ConcreteBillingDetails>(
        ServerFailure('Failed to get billing details'),
      );
    }
  }
}

/// Doc Required
class GetBillingDetailsParams {
  /// Doc Required
  GetBillingDetailsParams({
    required this.userId,
  });

  /// Doc Required
  final String userId;
}
