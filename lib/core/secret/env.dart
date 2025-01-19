import 'package:envied/envied.dart';

part 'env.g.dart';

/// Loads environment variables from a .env file and handles obfuscation.

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'ONE_SIGNAL_APP_ID', obfuscate: true)

  /// The OneSignal App ID loaded from the environment.
  static String oneSignalAppID = _Env.oneSignalAppID;
}
