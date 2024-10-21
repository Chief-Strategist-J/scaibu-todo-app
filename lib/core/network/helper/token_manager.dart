import 'package:todo_app/core/app_library.dart';

class TokenManager {
  String? _cachedToken;
  DateTime? _tokenExpiry;
  final Duration _tokenLifetime;

  TokenManager([this._tokenLifetime = const Duration(minutes: 5)]);

  Future<String?> getToken(UserCredentials credentials) async {
    if (_isTokenValid()) {
      return _cachedToken;
    }

    final token = await credentials.box.get(credentials.accessToken);
    if (token != null) {
      _cachedToken = token;
      _tokenExpiry = DateTime.now().add(_tokenLifetime);
    }

    return token;
  }

  bool _isTokenValid() {
    return _cachedToken != null && _tokenExpiry != null && DateTime.now().isBefore(_tokenExpiry!);
  }

  void invalidateToken() {
    _cachedToken = null;
    _tokenExpiry = null;
  }
}