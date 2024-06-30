import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'ONE_SIGNAL_APP_ID', obfuscate: true)
  static String oneSignalAppID = _Env.oneSignalAppID;
}