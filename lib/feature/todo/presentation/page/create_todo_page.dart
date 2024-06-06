import 'package:todo_app/core/todo_library.dart';

class CreateTodoPage extends HookWidget {
  CreateTodoPage({super.key});

  final _validatorKey = GlobalKey<FormState>();

  Future<void> _onTapOfCreateTodo(
    TextEditingController titleController,
    TextEditingController descriptionController,
    BuildContext context,
  ) async {
    if (!_validatorKey.currentState!.validate()) return;

    final firebaseTodo = TodoRepositoryImpl(FirebaseApiImpl());
    final serverTodo = TodoRepositoryImpl(LocalApiImpl(RestApiImpl()));

    final Map<String, dynamic> todo = {
      'title': titleController.text,
      'description': descriptionController.text,
    };

    final _createTodo = await CreateTodoUseCase(
      firebaseTodo: firebaseTodo,
      serverTodo: serverTodo,
    );

    _createTodo.call(todo);

    finish(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool _isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom == 0;

    final _titleController = useTextEditingController();
    final _dateController = useTextEditingController();
    final _startTimeController = useTextEditingController();
    final _endTimeController = useTextEditingController();
    final _descriptionController = useTextEditingController();

    final _titleNode = useFocusNode();
    final _dateNode = useFocusNode();
    final _startTimeNode = useFocusNode();
    final _endTimeNode = useFocusNode();
    final _descriptionNode = useFocusNode();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Form(
              key: _validatorKey,
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
                    title: 'Title',
                    controller: _titleController,
                    focusNode: _titleNode,
                  ),
                  ContentWidget(
                    title: 'Date',
                    controller: _dateController,
                    focusNode: _dateNode,
                    isDateField: true,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ContentWidget(
                          title: 'Start Time',
                          controller: _startTimeController,
                          focusNode: _startTimeNode,
                          isTimeField: true,
                        ),
                      ),
                      16.width,
                      Flexible(
                        child: ContentWidget(
                          title: 'End Time',
                          controller: _endTimeController,
                          focusNode: _endTimeNode,
                          isTimeField: true,
                        ),
                      ),
                    ],
                  ),
                  ContentWidget(
                    title: 'Descriptions',
                    controller: _descriptionController,
                    focusNode: _descriptionNode,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            if (_isKeyboardOpen)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: CustomButton(
                  data: "Create New Task",
                  onTap: () async {
                    await _onTapOfCreateTodo(_titleController, _descriptionController, context);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
