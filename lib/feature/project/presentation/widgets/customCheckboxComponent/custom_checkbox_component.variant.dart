import 'package:todo_app/core/app_library.dart';

class CustomCheckboxComponentVariant extends Variant {
  const CustomCheckboxComponentVariant._(super.name);

  static const light = CustomCheckboxComponentVariant._('custom.light');
  static const dark = CustomCheckboxComponentVariant._('custom.dark');

  static const elevated = CustomCheckboxComponentVariant._('custom.elevated');
  static const flat = CustomCheckboxComponentVariant._('custom.flat');
}
