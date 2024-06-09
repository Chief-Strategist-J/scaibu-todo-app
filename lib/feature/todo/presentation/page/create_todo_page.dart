import 'package:todo_app/core/todo_library.dart';

class CreateTodoPage extends HookWidget {
  CreateTodoPage({super.key});

  Future<void> _onTapOfCreateTodo(
    _TodoPageModel todoPage,
    BuildContext context,
  ) async {
    if (!todoPage.validatorKey.currentState!.validate()) {
      toast("Field must be validated");
      return;
    } else {
      context.read<TodoBloc>().createTodo(todoPage.titleController, todoPage.descriptionController);
      finish(context);
    }
  }

  Widget _showCreateTodoButton({
    required _TodoPageModel todoPage,
    required BuildContext context,
  }) {
    final bool isKeyboardNotOpened = MediaQuery.of(context).viewInsets.bottom == 0;

    if (!isKeyboardNotOpened) return Offstage();

    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: CustomButton(
        data: "Create New Task",
        onTap: () async {
          await _onTapOfCreateTodo(todoPage, context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _TodoPageModel todoPage = _TodoPageModel(
      titleController: useTextEditingController(text: 'Task'),
      dateController: useTextEditingController(text: timeService.initialDate),
      startTimeController: useTextEditingController(text: timeService.currentTime),
      endTimeController: useTextEditingController(text: timeService.currentTimeAfterMinute()),
      descriptionController: useTextEditingController(text: '-'),
      titleNode: useFocusNode(),
      dateNode: useFocusNode(),
      startTimeNode: useFocusNode(),
      endTimeNode: useFocusNode(),
      descriptionNode: useFocusNode(),
    );

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

class _TodoPageModel extends CreateTodoPage {
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

  _TodoPageModel({
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
