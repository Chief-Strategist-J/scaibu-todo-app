import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoListItemComponentVariant extends Variant {
  const TodoListItemComponentVariant._(super.name);

  /// Doc Required
  static const TodoListItemComponentVariant primary =
      TodoListItemComponentVariant._('custom.primary');
}
