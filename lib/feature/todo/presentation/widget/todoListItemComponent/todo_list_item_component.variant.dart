import 'package:todo_app/core/app_library.dart';

class TodoListItemComponentVariant extends Variant {
  const TodoListItemComponentVariant._(super.name);

  static const TodoListItemComponentVariant primary =
      TodoListItemComponentVariant._('custom.primary');
}
