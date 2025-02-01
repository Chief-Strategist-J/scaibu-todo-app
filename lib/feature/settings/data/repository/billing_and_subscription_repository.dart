import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/settings/domain/repositories/billing_and_subscription_repository.dart';

/// Doc Required
class BillingAndSubscriptionImpl
    extends BillingAndSubscriptionRepository<dynamic> {
  /// Doc Required
  @override
  Future<void> cancelSubscription(final String userId) {
    // TO-DO: implement cancelSubscription
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> getBillingDetails(final String userId) {
    // TO-DO: implement getBillingDetails
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> getSubscriptionDetails(final String userId) {
    // TO-DO: implement getSubscriptionDetails
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> updateBillingDetails(
    final String userId,
    final Map<String, dynamic> billingDetails,
  ) {
    // TO-DO: implement updateBillingDetails
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> updateSubscriptionDetails(
    final String userId,
    final Map<String, dynamic> subscriptionDetails,
  ) {
    // TO-DO: implement updateSubscriptionDetails
    throw UnimplementedError();
  }
}
