import 'package:todo_app/core/todo_library.dart';

class TodoListItemComponentVariant extends Variant {
  const TodoListItemComponentVariant._(super.name);

  static const primary = TodoListItemComponentVariant._('custom.primary');
}
