import 'package:mix/mix.dart';

class AuthCustomButtonVariant extends Variant {
  const AuthCustomButtonVariant._(super.name);

  static const AuthCustomButtonVariant primary =
      AuthCustomButtonVariant._('custom.primary');

  static const AuthCustomButtonVariant secondary =
      AuthCustomButtonVariant._('custom.secondary');
}
