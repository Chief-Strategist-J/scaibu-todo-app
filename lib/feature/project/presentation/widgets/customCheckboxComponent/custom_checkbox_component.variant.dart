import 'package:todo_app/core/app_library.dart';
/// Doc Required
class CustomCheckboxComponentVariant extends Variant {
  const CustomCheckboxComponentVariant._(super.name);

  /// Doc Required
  static const CustomCheckboxComponentVariant light =
      CustomCheckboxComponentVariant._('custom.light');

  /// Doc Required
  static const CustomCheckboxComponentVariant dark =
      CustomCheckboxComponentVariant._('custom.dark');

  /// Doc Required
  static const CustomCheckboxComponentVariant elevated =
      CustomCheckboxComponentVariant._('custom.elevated');

  /// Doc Required
  static const CustomCheckboxComponentVariant flat =
      CustomCheckboxComponentVariant._('custom.flat');
}
