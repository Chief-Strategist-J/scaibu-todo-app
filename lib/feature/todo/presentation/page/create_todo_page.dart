import 'package:todo_app/core/network/network_service.dart';
import 'package:todo_app/core/routes/route_service.dart';
import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/data/dataSource/firebase_api_impl.dart';
import 'package:todo_app/feature/todo/data/dataSource/local_api_impl.dart';
import 'package:todo_app/feature/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_app/feature/todo/domain/useCases/create_todo_use_case.dart';
import 'package:todo_app/feature/todo/presentation/widget/content_widget.dart';
import 'package:todo_app/feature/todo/presentation/widget/custom_button.dart';

class CreateTodoPage extends HookWidget {
  CreateTodoPage({super.key});

  final _formKey = GlobalKey<FormState>();
  Future<void> _onTapOfCreateTodo(
    TextEditingController titleController,
    TextEditingController descriptionController,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      final firebaseTodo = TodoRepositoryImpl(FirebaseApiImpl());
      final serverTodo = TodoRepositoryImpl(LocalApiImpl(RestApiImpl()));

      final Map<String, dynamic> todo = {
        'title': titleController.text,
        'description': descriptionController.text,
      };

      await CreateTodoUseCase(firebaseTodo: firebaseTodo, serverTodo: serverTodo).call(todo);
      finish(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool _isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom == 0;

    final titleController = useTextEditingController();
    final dateController = useTextEditingController();
    final startTimeController = useTextEditingController();
    final endTimeController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final titleNode = useFocusNode();
    final dateNode = useFocusNode();
    final startTimeNode = useFocusNode();
    final endTimeNode = useFocusNode();
    final descriptionNode = useFocusNode();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Form(
              key: _formKey,
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
                    controller: titleController,
                    focusNode: titleNode,
                  ),
                  ContentWidget(
                    title: 'Date',
                    controller: dateController,
                    focusNode: dateNode,
                    isDateField: true,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ContentWidget(
                          title: 'Start Time',
                          controller: startTimeController,
                          focusNode: startTimeNode,
                          isTimeField: true,
                        ),
                      ),
                      16.width,
                      Flexible(
                        child: ContentWidget(
                          title: 'End Time',
                          controller: endTimeController,
                          focusNode: endTimeNode,
                          isTimeField: true,
                        ),
                      ),
                    ],
                  ),
                  ContentWidget(
                    title: 'Descriptions',
                    controller: descriptionController,
                    focusNode: descriptionNode,
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
                    await _onTapOfCreateTodo(titleController, descriptionController, context);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
