import 'package:mix/mix.dart';

class AuthCustomButtonVariant extends Variant {
  const AuthCustomButtonVariant._(super.name);

  static const primary = AuthCustomButtonVariant._('custom.primary');
  static const secondary = AuthCustomButtonVariant._('custom.secondary');
}
