/// Doc Required
abstract class PaymentAccountRepository<T> {
  /// Get payment account details
  Future<T> getPaymentAccountDetails(final String userId);

  /// Update payment account details
  Future<void> updatePaymentAccountDetails(
    final String userId,
    final Map<String, dynamic> paymentDetails,
  );

  /// Add a new payment method
  Future<void> addPaymentMethod(
    final String userId,
    final Map<String, dynamic> paymentMethod,
  );

  /// Remove a payment method
  Future<void> removePaymentMethod(
    final String userId,
    final String paymentMethodId,
  );
}
