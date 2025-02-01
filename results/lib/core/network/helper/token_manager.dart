import 'package:todo_app/core/app_library.dart';

/// A class for managing authentication tokens.
class TokenManager {
  /// Cached token and expiry time.
  String? _cachedToken;
  DateTime? _tokenExpiry;

  /// The duration for which the token is valid.
  final Duration _tokenLifetime;

  /// Constructor to initialize the token manager with a custom lifetime.
  TokenManager([this._tokenLifetime = const Duration(minutes: 5)]);

  /// Gets the cached token if valid or retrieves a new one.
  Future<String?> getToken(final UserCredentials credentials) async {
    if (_isTokenValid()) {
      return _cachedToken;
    }

    final String token =
        await credentials.box.get(credentials.accessToken) as String;
    _cachedToken = token;
    _tokenExpiry = DateTime.now().add(_tokenLifetime);

    return token;
  }

  /// Checks if the current token is still valid.
  bool _isTokenValid() =>
      _cachedToken != null &&
      _tokenExpiry != null &&
      DateTime.now().isBefore(_tokenExpiry!);

  /// Invalidates the current token, forcing a new one to be fetched.
  void invalidateToken() {
    _cachedToken = null;
    _tokenExpiry = null;
  }
}
