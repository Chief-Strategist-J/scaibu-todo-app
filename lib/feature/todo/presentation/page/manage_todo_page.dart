import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoro_component.dart';

class ManageTodoPage extends HookWidget {
  final ManageTodoPageParam? todoPage;

  const ManageTodoPage({super.key, this.todoPage});

  bool get _getIsUpdateTodo => todoPage?.isUpdatingExistingTodo ?? false;

  String get _getTitle => _getIsUpdateTodo ? 'update_task'.tr() : 'new_task'.tr();

  String get _getButtonText => _getIsUpdateTodo ? 'update_task'.tr() : 'add_task'.tr();

  Future<bool> _onTapOfManageTodo(ManageTodoPageParam todoDetail, BuildContext context, TodoBloc todoBloc) async {
    if (todoBloc.state is LoadingState) {
      toast("Loading please wait ...");
      return false;
    }

    if (!todoDetail.validatorKey.currentState!.validate()) {
      toast('field_must_be_validated'.tr());
      return false;
    }

    bool isNotNullTodo = todoPage != null;
    bool isUpdatingExistingTodo = _getIsUpdateTodo;
    bool isUpdatingTodo = isNotNullTodo || isUpdatingExistingTodo;

    if (isUpdatingTodo) {
      await todoBloc.onEditPageUpdateTodo(todoDetail);
    } else {
      await todoBloc.createTodo(todoDetail: todoDetail);
    }
    return true;
  }

  Future<void> _selectDateAndTime(BuildContext context, ManageTodoPageParam localTodoData) async {
    await timeService.selectDate(context).then((date) async {
      if (!date.isSelected) return;
      final now = DateTime.now();
      final bool isValidDate = date.dateTime.isAfter(DateTime(now.year, now.month, now.day - 1));

      if (isValidDate) {
        localTodoData.date = date;
        localTodoData.dateController.text = date.formatTimeInString;
        await _selectStartAndEndTime(context, localTodoData);
      } else {
        toast("Select a valid date, not one that has passed.", bgColor: redColor);
        _selectDateAndTime(context, localTodoData);
      }
    });
  }

  Future<void> _selectStartAndEndTime(BuildContext context, ManageTodoPageParam localTodoData) async {
    await timeService.selectTime(context).then((startTime) async {
      if (!startTime.isSelected) return;

      final bool isValidStartTime = startTime.dateTime.isAfter(DateTime.now());

      if (isValidStartTime) {
        localTodoData.startTime = startTime;
        localTodoData.startTimeController.text = startTime.formatTimeInString;
        await _selectEndTime(context, startTime, localTodoData);
      } else {
        toast("Choose a valid start time,\n not past.", bgColor: redColor);
        await _selectStartAndEndTime(context, localTodoData);
      }
    });
  }

  Future<void> _selectEndTime(
    BuildContext context,
    TimeServiceModel startTime,
    ManageTodoPageParam localTodoData,
  ) async {
    await timeService.selectTime(context).then((endTime) async {
      if (!endTime.isSelected) return;

      final bool endTimeIsMoreTheStartTime = endTime.dateTime.isAfter(startTime.dateTime);

      if (endTimeIsMoreTheStartTime) {
        localTodoData.endTime = endTime;
        localTodoData.endTimeController.text = endTime.formatTimeInString;
      } else {
        toast("End time must be after start time.\n Please retry.", bgColor: redColor);
        await _selectStartAndEndTime(context, localTodoData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localTodoData = useMemoized(() => todoPage ?? ManageTodoPageParam(), [todoPage]);
    final bool isKeyboardNotOpened = MediaQuery.of(context).viewInsets.bottom == 0;

    final todoBloc = useMemoized(() => context.read<TodoBloc>(), [isInternetConnected]);

    useEffect(() {
      if (!isInternetConnected) {
        todoBloc.add(NoInternetConnectionEvent());
      }

      return null;
    }, [isInternetConnected]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Form(
            key: localTodoData.validatorKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: AnimatedScrollView(
              listAnimationType: ListAnimationType.None,
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 60),
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
                  onSelectOfDateOrTime: (p0) {
                    localTodoData.date = p0;
                  },
                  onTap: () async {
                    await _selectDateAndTime(context, localTodoData);
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
                      await _selectStartAndEndTime(context, localTodoData);
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
                      await _selectEndTime(context, localTodoData.startTime!, localTodoData);
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
                if (todoPage == null)
                  ValueListenableBuilder(
                    valueListenable: localTodoData.isWantToDeleteTodoAtEndTimeNotifier,
                    builder: (context, value, child) {
                      return CheckboxListTile(
                        value: value,
                        contentPadding: EdgeInsets.zero,
                        title: const Text.rich(
                          TextSpan(text: "Want to delete at end time?", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), children: [
                            TextSpan(
                              text: "\nNote : You cannot modify it later",
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorRed),
                            ),
                          ]),
                        ),
                        onChanged: (value) {
                          localTodoData.isWantToDeleteTodoAtEndTime = value ?? false;
                          localTodoData.isWantToDeleteTodoAtEndTimeNotifier.value = value ?? false;
                        },
                      );
                    },
                  ),
                const TaskDetailComponent(),
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
                  if (todoBloc.state is LoadingState) return const Offstage();
                  if (todoBloc.state is NoInternetState) return const Offstage();

                  if (todoBloc.state is InitTodoState) {
                    return CustomButton(
                      data: _getButtonText,
                      onTap: () async {
                        await _onTapOfManageTodo(localTodoData, context, todoBloc).then((value) {
                          GoRouter.of(context).go(ApplicationPaths.todoListViewPage);
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
    );
  }
}

class ManageTodoPageParam {
  final FocusNode titleNode = FocusNode();
  final FocusNode dateNode = FocusNode();
  final FocusNode startTimeNode = FocusNode();
  final FocusNode endTimeNode = FocusNode();
  final FocusNode descriptionNode = FocusNode();
  final FocusNode notesNode = FocusNode();

  final validatorKey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController(text: 'Task');
  final TextEditingController description = TextEditingController(text: '-');
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController note = TextEditingController();

  TimeServiceModel? date;
  TimeServiceModel? startTime;
  TimeServiceModel? endTime;

  final String? firebaseTodoId;
  final String? todoId;

  // For single value update we can use value listenable builder
  final ValueNotifier<bool> isWantToDeleteTodoAtEndTimeNotifier;
  bool isWantToDeleteTodoAtEndTime;

  final bool isUpdatingExistingTodo;

  ManageTodoPageParam({
    this.firebaseTodoId,
    this.todoId,
    this.date,
    this.startTime,
    this.endTime,
    this.isUpdatingExistingTodo = false,
    this.isWantToDeleteTodoAtEndTime = true,
  }) : isWantToDeleteTodoAtEndTimeNotifier = ValueNotifier(isWantToDeleteTodoAtEndTime);

  factory ManageTodoPageParam.fromTodoEntity(
    TodoEntity todoData, {
    bool isUpdatingExistingTodo = true,
  }) {
    ManageTodoPageParam param = ManageTodoPageParam(
      firebaseTodoId: todoData.firebaseTodoId.validate(),
      todoId: todoData.todoId.validate().toString(),
      isUpdatingExistingTodo: isUpdatingExistingTodo,
    );

    if (todoData.date != null) param.dateController.text = timeService.convertToDate(todoData.date!);
    if (todoData.startTime != null) param.startTimeController.text = timeService.convertToTime(todoData.startTime!);
    if (todoData.endTime != null) param.endTimeController.text = timeService.convertToTime(todoData.endTime!);

    param.note.text = todoData.notes.validate();
    param.title.text = todoData.title.validate();
    param.description.text = todoData.description.validate();

    return param;
  }
}
