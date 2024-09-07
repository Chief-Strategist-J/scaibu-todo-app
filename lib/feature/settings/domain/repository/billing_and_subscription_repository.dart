abstract class BillingAndSubscriptionRepository<T> {
  // Get billing details
  Future<T> getBillingDetails(String userId);

  // Update billing details
  Future<void> updateBillingDetails(String userId, Map<String, dynamic> billingDetails);

  // Get subscription details
  Future<T> getSubscriptionDetails(String userId);

  // Update subscription details
  Future<void> updateSubscriptionDetails(String userId, Map<String, dynamic> subscriptionDetails);

  // Cancel subscription
  Future<void> cancelSubscription(String userId);
}
