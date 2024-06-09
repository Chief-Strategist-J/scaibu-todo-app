import 'package:todo_app/core/todo_library.dart';

class EditTodoPage extends HookWidget {
  final EditTodoPageParam todoPage;

  EditTodoPage(this.todoPage, {super.key});

  Future<void> _onTapOfCreateTodo(
    EditTodoPageParam todoPage,
    BuildContext context,
  ) async {
    if (!todoPage.validatorKey.currentState!.validate()) {
      toast("Field must be validated");
      return;
    } else {
      final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();

      final Map<String, dynamic> todoData = {
        'todo_id': todoPage.todoId,
        'title': todoPage.titleController.text,
        'description': todoPage.descriptionController.text,
      };

      final updateTodo = UpdateTodoParam(
        firebaseID: todoPage.firebaseTodoId,
        localID: todoPage.todoId,
        todoData: todoData,
      );

      await updateTodoUseCase(updateTodo).then((value) {
        context.read<TodoBloc>().add(InitEvent([]));
        finish(context);
      });
    }
  }

  Widget _showCreateTodoButton({
    required EditTodoPageParam todoPage,
    required BuildContext context,
  }) {
    final bool isKeyboardNotOpened = MediaQuery.of(context).viewInsets.bottom == 0;

    if (!isKeyboardNotOpened) return Offstage();

    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: CustomButton(
        data: "Edit Task",
        onTap: () async {
          await _onTapOfCreateTodo(todoPage, context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Form(
              key: todoPage.validatorKey,
              autovalidateMode: AutovalidateMode.always,
              child: AnimatedScrollView(
                listAnimationType: ListAnimationType.None,
                padding: EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("New Task", style: boldTextStyle(size: 28))),
                    ],
                  ),
                  ContentWidget(
                    title: 'Task',
                    controller: todoPage.titleController,
                    focusNode: todoPage.titleNode,
                  ),
                  ContentWidget(
                    title: 'Date',
                    controller: todoPage.dateController,
                    focusNode: todoPage.dateNode,
                    isDateField: true,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ContentWidget(
                          title: 'Start Time',
                          controller: todoPage.startTimeController,
                          focusNode: todoPage.startTimeNode,
                          isTimeField: true,
                        ),
                      ),
                      16.width,
                      Flexible(
                        child: ContentWidget(
                          title: 'End Time',
                          controller: todoPage.endTimeController,
                          focusNode: todoPage.endTimeNode,
                          isTimeField: true,
                        ),
                      ),
                    ],
                  ),
                  ContentWidget(
                    title: 'Descriptions',
                    controller: todoPage.descriptionController,
                    focusNode: todoPage.descriptionNode,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            _showCreateTodoButton(
              todoPage: todoPage,
              context: context,
            )
          ],
        ),
      ),
    );
  }
}

class EditTodoPageParam {
  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController descriptionController;
  final String firebaseTodoId;
  final String todoId;

  final validatorKey = GlobalKey<FormState>();

  final FocusNode titleNode;
  final FocusNode dateNode;
  final FocusNode startTimeNode;
  final FocusNode endTimeNode;
  final FocusNode descriptionNode;

  EditTodoPageParam({
    required this.firebaseTodoId,
    required this.todoId,
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
