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

class ManageTodoPage extends StatelessWidget {
  final ManageTodoPageParam? todoPage;

  const ManageTodoPage({super.key, this.todoPage});

  bool get getIsUpdateTodo => todoPage?.isUpdatingExistingTodo ?? false;

  String get getTitle => getIsUpdateTodo ? 'update_task'.tr() : 'new_task'.tr();

  String get getButtonText => getIsUpdateTodo ? 'update_task'.tr() : 'add_task'.tr();

  Future<void> _onTapOfManageTodo(ManageTodoPageParam todoDetail, BuildContext context) async {
    if (!isInternetConnected) {
      toast('connect_to_the_internet_to_perform_this_operation'.tr());
      return;
    }

    if (context.read<TodoBloc>().state == LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    if (!todoDetail.validatorKey.currentState!.validate()) {
      toast('field_must_be_validated'.tr());
      return;
    }

    final bloc = context.read<TodoBloc>();

    bool isNotNullTodo = todoPage != null;
    bool isUpdatingExistingTodo = getIsUpdateTodo;
    bool isUpdatingTodo = isNotNullTodo || isUpdatingExistingTodo;

    if (isUpdatingTodo) {
      await bloc.onEditPageUpdateTodo(todoDetail);
    } else {
      await bloc.createTodo(todoDetail: todoDetail);
    }

    finish(context);
  }

  Widget _todoButton({
    required ManageTodoPageParam todoDetail,
    required BuildContext context,
  }) {
    final bool isKeyboardNotOpened = MediaQuery.of(context).viewInsets.bottom == 0;

    if (!isKeyboardNotOpened) return Offstage();

    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: CustomButton(
        data: getButtonText,
        onTap: () async {
          await _onTapOfManageTodo(todoDetail, context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _todoPage = todoPage ??
        ManageTodoPageParam(
          titleController: TextEditingController(text: 'Task'),
          dateController: TextEditingController(text: timeService.initialDate),
          startTimeController: TextEditingController(text: timeService.currentTime),
          endTimeController: TextEditingController(text: timeService.currentTimeAfterMinute()),
          descriptionController: TextEditingController(text: '-'),
        );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Form(
              key: _todoPage.validatorKey,
              autovalidateMode: AutovalidateMode.always,
              child: AnimatedScrollView(
                listAnimationType: ListAnimationType.None,
                padding: EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(getTitle, style: boldTextStyle(size: 28))),
                    ],
                  ),
                  ContentWidget(
                    title: 'task'.tr(),
                    controller: _todoPage.titleController,
                    focusNode: _todoPage.titleNode,
                  ),
                  ContentWidget(
                    title: 'date'.tr(),
                    controller: _todoPage.dateController,
                    focusNode: _todoPage.dateNode,
                    isDateField: true,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ContentWidget(
                          title: 'start_time'.tr(),
                          controller: _todoPage.startTimeController,
                          focusNode: _todoPage.startTimeNode,
                          isTimeField: true,
                        ),
                      ),
                      16.width,
                      Flexible(
                        child: ContentWidget(
                          title: 'end_time'.tr(),
                          controller: _todoPage.endTimeController,
                          focusNode: _todoPage.endTimeNode,
                          isTimeField: true,
                        ),
                      ),
                    ],
                  ),
                  ContentWidget(
                    title: 'descriptions'.tr(),
                    controller: _todoPage.descriptionController,
                    focusNode: _todoPage.descriptionNode,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            _todoButton(todoDetail: _todoPage, context: context)
          ],
        ),
      ),
    );
  }
}
