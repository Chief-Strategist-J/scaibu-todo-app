import 'package:todo_app/core/app_library.dart';

class ManageTodoPage extends HookWidget {
  final ManageTodoPageParam? todoPage;

  const ManageTodoPage({super.key, this.todoPage});

  bool get _getIsUpdateTodo => todoPage?.isUpdatingExistingTodo ?? false;

  String get _getTitle => _getIsUpdateTodo ? 'update_task'.tr() : 'new_task'.tr();

  String get _getButtonText => _getIsUpdateTodo ? 'update_task'.tr() : 'add_task'.tr();

  @override
  Widget build(BuildContext context) {
    final localTodoData = useMemoized(() => todoPage ?? ManageTodoPageParam(), [todoPage]);

    final util = useMemoized(() => ManageTodoPageUtils(context, localTodoData), []);

    final bool isKeyboardNotOpened = MediaQuery.of(context).viewInsets.bottom == 0;

    final todoBloc = useMemoized(() => context.read<TodoBloc>(), [isInternetConnected]);

    useEffect(() {
      if (!isInternetConnected) {
        todoBloc.add(NoInternetConnectionEvent());
      }

      return null;
    }, [isInternetConnected]);

    useEffect(() {
      return util.dispose;
    }, [util]);

    final _buttonWidget = context.select(
      (TodoBloc todoBloc) {
        if (todoBloc.state is LoadingState) return const Offstage();
        if (todoBloc.state is NoInternetState) return const Offstage();
        if (todoBloc.state is InitTodoState) {
          return CustomButton(
            data: _getButtonText,
            onTap: () async {
              await util.onTapOfManageTodo(todoBloc: todoBloc, todoPage: todoPage);
            },
          );
        }
        return const Offstage();
      },
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Form(
            key: localTodoData.validatorKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: AnimatedScrollView(
              listAnimationType: ListAnimationType.None,
              padding: const EdgeInsets.only(bottom: 120, right: 16, left: 16, top: 60),
              children: [
                Row(
                  children: [
                    Expanded(child: Text(_getTitle, style: boldTextStyle(size: 28))),
                  ],
                ),
                ContentWidget(
                  title: 'task'.tr(),
                  controller: localTodoData.title,
                  focusNode: localTodoData.titleNode,
                ),
                ContentWidget(
                  title: 'descriptions'.tr(),
                  controller: localTodoData.description,
                  focusNode: localTodoData.descriptionNode,
                ),
                ContentWidget(
                  title: 'date'.tr(),
                  controller: localTodoData.dateController,
                  focusNode: localTodoData.dateNode,
                  isDateField: true,
                  onTap: () async {
                    await util.selectDateAndTime();
                  },
                ),
                ContentWidget(
                  title: 'start_time'.tr(),
                  controller: localTodoData.startTimeController,
                  focusNode: localTodoData.startTimeNode,
                  isTimeField: true,
                  onTap: () async {
                    if (localTodoData.date == null) {
                      toast("Please select a date before the start-time", bgColor: redColor);
                    } else {
                      await util.selectStartAndEndTime();
                    }
                  },
                ),
                16.height,
                ContentWidget(
                  title: 'end_time'.tr(),
                  controller: localTodoData.endTimeController,
                  focusNode: localTodoData.endTimeNode,
                  isTimeField: true,
                  onTap: () async {
                    if (localTodoData.startTime == null) {
                      toast("Please select a start time before the end-time.", bgColor: redColor);
                    } else {
                      await util.selectEndTime(localTodoData.startTime!);
                    }
                  },
                ),
                ContentWidget(
                  title: "Notes",
                  textFieldType: TextFieldType.MULTILINE,
                  lines: 5,
                  controller: localTodoData.note,
                  focusNode: localTodoData.notesNode,
                  textInputAction: TextInputAction.done,
                ),
                TaskDetailComponent(localTodoData: localTodoData),
              ],
            ),
          ),
          if (!isKeyboardNotOpened) const Offstage() else Positioned(bottom: 16, left: 16, right: 16, child: _buttonWidget)
        ],
      ),
    );
  }
}
