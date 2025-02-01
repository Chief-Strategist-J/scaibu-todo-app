part of use_case;

// Temporary concrete class for demonstration
/// Doc Required
class ConcreteSubscriptionDetails {
  /// Doc Required
  ConcreteSubscriptionDetails({required this.subscriptionInfo});

  /// Doc Required
  final String subscriptionInfo;
}

/// Doc Required
class GetSubscriptionDetailsParams {
  /// Doc Required
  GetSubscriptionDetailsParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetSubscriptionDetailsUseCase
    extends UseCase<ConcreteSubscriptionDetails, GetSubscriptionDetailsParams> {
  /// Doc Required
  GetSubscriptionDetailsUseCase({
    required this.billingAndSubscriptionRepository,
  });

  /// Doc Required
  final BillingAndSubscriptionRepository<ConcreteSubscriptionDetails>
      billingAndSubscriptionRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcreteSubscriptionDetails>> call(
    final GetSubscriptionDetailsParams params,
  ) async {
    try {
      final ConcreteSubscriptionDetails details =
          await billingAndSubscriptionRepository
              .getSubscriptionDetails(params.userId);

      return Right<Failure, ConcreteSubscriptionDetails>(details);
    } catch (e) {
      return Left<Failure, ConcreteSubscriptionDetails>(
        ServerFailure('Failed to get subscription details'),
      );
    }
  }
}
