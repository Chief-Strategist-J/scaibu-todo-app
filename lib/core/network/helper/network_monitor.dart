import 'package:todo_app/core/app_library.dart';

/// Network connectivity monitoring
class NetworkMonitor {
  /// Checks if the network is available by attempting a lookup.
  Future<bool> isNetworkAvailable() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('example.com');

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
