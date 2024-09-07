abstract class PaymentAccountRepository<T> {
  // Get payment account details
  Future<T> getPaymentAccountDetails(String userId);

  // Update payment account details
  Future<void> updatePaymentAccountDetails(String userId, Map<String, dynamic> paymentDetails);

  // Add a new payment method
  Future<void> addPaymentMethod(String userId, Map<String, dynamic> paymentMethod);

  // Remove a payment method
  Future<void> removePaymentMethod(String userId, String paymentMethodId);
}
