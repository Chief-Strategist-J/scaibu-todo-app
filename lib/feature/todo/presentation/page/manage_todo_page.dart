import 'package:todo_app/core/app_library.dart';

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

  TimeServiceModel? date;
  TimeServiceModel? startTime;
  TimeServiceModel? endTime;

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
    this.date,
    this.startTime,
    this.endTime,
    this.isUpdatingExistingTodo = false,
  });
}

class ManageTodoPage extends HookWidget {
  final ManageTodoPageParam? todoPage;

  const ManageTodoPage({super.key, this.todoPage});

  bool get getIsUpdateTodo => todoPage?.isUpdatingExistingTodo ?? false;

  String get getTitle => getIsUpdateTodo ? 'update_task'.tr() : 'new_task'.tr();

  String get getButtonText => getIsUpdateTodo ? 'update_task'.tr() : 'add_task'.tr();

  Future<void> _onTapOfManageTodo(
    ManageTodoPageParam todoDetail,
    BuildContext context,
    TodoBloc todoBloc,
  ) async {
    if (!isInternetConnected) {
      todoBloc.add(NoInternetConnectionEvent());
      toast('connect_to_the_internet_to_perform_this_operation'.tr());
      return;
    }

    if (todoBloc.state is LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    if (!todoDetail.validatorKey.currentState!.validate()) {
      toast('field_must_be_validated'.tr());
      return;
    }

    bool isNotNullTodo = todoPage != null;
    bool isUpdatingExistingTodo = getIsUpdateTodo;
    bool isUpdatingTodo = isNotNullTodo || isUpdatingExistingTodo;

    if (isUpdatingTodo) {
      await todoBloc.onEditPageUpdateTodo(todoDetail);
    } else {
      await todoBloc.createTodo(todoDetail: todoDetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localTodoData = todoPage ??
        ManageTodoPageParam(
          titleController: TextEditingController(text: 'Task'),
          dateController: TextEditingController(),
          startTimeController: TextEditingController(),
          endTimeController: TextEditingController(),
          descriptionController: TextEditingController(text: '-'),
        );
    final bool isKeyboardNotOpened = MediaQuery.of(context).viewInsets.bottom == 0;
    final todoBloc = useMemoized(() => GetIt.instance<TodoBloc>(), []);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Form(
              key: localTodoData.validatorKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: AnimatedScrollView(
                listAnimationType: ListAnimationType.None,
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(getTitle, style: boldTextStyle(size: 28))),
                    ],
                  ),
                  ContentWidget(
                    title: 'task'.tr(),
                    controller: localTodoData.titleController,
                    focusNode: localTodoData.titleNode,
                  ),
                  ContentWidget(
                    title: 'descriptions'.tr(),
                    controller: localTodoData.descriptionController,
                    focusNode: localTodoData.descriptionNode,
                    textInputAction: TextInputAction.done,
                  ),
                  ContentWidget(
                    title: 'date'.tr(),
                    controller: localTodoData.dateController,
                    focusNode: localTodoData.dateNode,
                    isDateField: true,
                    onSelectOfDateOrTime: (p0) {
                      localTodoData.date = p0;
                    },
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ContentWidget(
                          title: 'start_time'.tr(),
                          controller: localTodoData.startTimeController,
                          focusNode: localTodoData.startTimeNode,
                          isTimeField: true,
                          onSelectOfDateOrTime: (p0) {
                            localTodoData.startTime = p0;
                          },
                        ),
                      ),
                      16.width,
                      Flexible(
                        child: ContentWidget(
                          title: 'end_time'.tr(),
                          controller: localTodoData.endTimeController,
                          focusNode: localTodoData.endTimeNode,
                          isTimeField: true,
                          onSelectOfDateOrTime: (p0) {
                            localTodoData.endTime = p0;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (!isKeyboardNotOpened)
              const Offstage()
            else
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: BlocBuilder<TodoBloc, TodoState>(
                  bloc: todoBloc,
                  builder: (_, state) {
                    if (context.read<TodoBloc>().state is LoadingState) return const Offstage();
                    if (context.read<TodoBloc>().state is NoInternetConnectionState) return const Offstage();

                    if (context.read<TodoBloc>().state is InitTodoState) {
                      return CustomButton(
                        data: getButtonText,
                        onTap: () {
                          _onTapOfManageTodo(localTodoData, context, todoBloc).then((value) {
                            context.go(ApplicationPaths.todoListViewPage);
                          });
                        },
                      );
                    }

                    return const Offstage();
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
