abstract class LinkedAccountsRepository<T> {
  // Get list of linked accounts
  Future<List<T>> getLinkedAccounts(String userId);

  // Link a new account
  Future<void> linkAccount(String userId, Map<String, dynamic> accountDetails);

  // Unlink an account
  Future<void> unlinkAccount(String userId, String accountId);
}
