/// Doc Required
abstract class BillingAndSubscriptionRepository<T> {
  /// Get billing details
  Future<T> getBillingDetails(final String userId);

  /// Update billing details
  Future<void> updateBillingDetails(
    final String userId,
    final Map<String, dynamic> billingDetails,
  );

  /// Get subscription details
  Future<T> getSubscriptionDetails(final String userId);

  /// Update subscription details
  Future<void> updateSubscriptionDetails(
    final String userId,
    final Map<String, dynamic> subscriptionDetails,
  );

  /// Cancel subscription
  Future<void> cancelSubscription(final String userId);
}
