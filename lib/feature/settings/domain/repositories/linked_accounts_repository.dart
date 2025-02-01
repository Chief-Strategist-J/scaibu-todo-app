/// Doc Required
abstract class LinkedAccountsRepository<T> {
  /// Get list of linked accounts
  Future<List<T>> getLinkedAccounts(final String userId);

  /// Link a new account
  Future<void> linkAccount(
    final String userId,
    final Map<String, dynamic> accountDetails,
  );

  /// Unlink an account
  Future<void> unlinkAccount(final String userId, final String accountId);
}
