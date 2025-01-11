import 'package:todo_app/core/app_library.dart';

class CustomButtonVariant extends Variant {
  const CustomButtonVariant._(super.name);

  static const CustomButtonVariant primary =
      CustomButtonVariant._('custom.primary');

  static const CustomButtonVariant secondary =
      CustomButtonVariant._('custom.secondary');
}
