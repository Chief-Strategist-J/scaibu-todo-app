import 'package:todo_app/core/todo_library.dart';

class ManageTodoPageParam {
  final FocusNode titleNode = FocusNode();
  final FocusNode dateNode = FocusNode();
  final FocusNode startTimeNode = FocusNode();
  final FocusNode endTimeNode = FocusNode();
  final FocusNode descriptionNode = FocusNode();
  final validatorKey = GlobalKey<FormState>();

  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController descriptionController;

  final String? firebaseTodoId;
  final String? todoId;
  final bool isUpdatingExistingTodo;

  ManageTodoPageParam({
    this.firebaseTodoId,
    this.todoId,
    required this.titleController,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    required this.descriptionController,
    this.isUpdatingExistingTodo = false,
  });
}
