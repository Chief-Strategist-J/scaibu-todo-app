import 'package:todo_app/core/app_library.dart';

/// Defines the available variants for a custom button, extending
/// the base Variant class.
class CustomButtonVariant extends Variant {
  /// Private constructor for creating custom button variants.
  const CustomButtonVariant._(super.name);

  /// Represents the primary style variant for a custom button.
  static const CustomButtonVariant primary =
      CustomButtonVariant._('custom.primary');

  /// Represents the secondary style variant for a custom button.
  static const CustomButtonVariant secondary =
      CustomButtonVariant._('custom.secondary');
}
