import 'package:todo_app/core/todo_library.dart';

class EditTodoPageParam {
  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController descriptionController;
  final String firebaseTodoId;
  final String todoId;

  final validatorKey = GlobalKey<FormState>();

  final FocusNode titleNode = FocusNode();
  final FocusNode dateNode = FocusNode();
  final FocusNode startTimeNode = FocusNode();
  final FocusNode endTimeNode = FocusNode();
  final FocusNode descriptionNode = FocusNode();

  EditTodoPageParam({
    required this.firebaseTodoId,
    required this.todoId,
    required this.titleController,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    required this.descriptionController,
  });
}

class CreatePageParameters extends CreateTodoPage {
  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController descriptionController;
  final validatorKey = GlobalKey<FormState>();

  final FocusNode titleNode;
  final FocusNode dateNode;
  final FocusNode startTimeNode;
  final FocusNode endTimeNode;
  final FocusNode descriptionNode;

  CreatePageParameters({
    required this.titleController,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    required this.descriptionController,
    required this.titleNode,
    required this.dateNode,
    required this.startTimeNode,
    required this.endTimeNode,
    required this.descriptionNode,
  });
}
