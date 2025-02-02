import 'package:todo_app/core/app_library.dart';

/// A ManageTodoPage class extending HookWidget, representing a page for
/// managing to-do tasks. It optionally accepts a todoPage
/// parameter of type ManageTodoPageParam.
class ManageTodoPage extends HookWidget {
  /// A const constructor for ManageTodoPage,
  /// optionally accepting a todoPage parameter.
  const ManageTodoPage({super.key, this.todoPage});

  /// An optional todoPage parameter of
  /// type ManageTodoPageParam, declared as final.
  final ManageTodoPageParam? todoPage;

  bool get _getIsUpdateTodo => todoPage?.isUpdatingExistingTodo ?? false;

  String get _getTitle =>
      _getIsUpdateTodo ? 'update_task'.tr() : 'new_task'.tr();

  String get _getButtonText =>
      _getIsUpdateTodo ? 'update_task'.tr() : 'add_task'.tr();

  @override
  Widget build(final BuildContext context) {
    final ManageTodoPageParam localTodoData = useMemoized(
      () => todoPage ?? ManageTodoPageParam(),
      <Object?>[todoPage],
    );

    final ManageTodoPageUtils util = useMemoized(
      () => ManageTodoPageUtils(context, localTodoData),
      <Object?>[],
    );

    final bool isKeyboardNotOpened =
        MediaQuery.of(context).viewInsets.bottom == 0;

    final TodoBloc todoBloc = useMemoized(
      () => context.read<TodoBloc>(),
      <Object?>[isInternetConnected],
    );

    useEffect(
      () {
        if (!isInternetConnected) {
          todoBloc.add(NoInternetConnectionEvent());
        }

        return null;
      },
      <Object?>[isInternetConnected],
    );

    useEffect(() => util.dispose, <Object?>[util]);

    final Widget buttonWidget = context.select(
      (final TodoBloc todoBloc) {
        if (todoBloc.state is LoadingState) {
          return const Offstage();
        }
        if (todoBloc.state is NoInternetState) {
          return const Offstage();
        }
        if (todoBloc.state is InitTodoState) {
          return CustomButton(
            data: _getButtonText,
            onTap: () async {
              await util.onTapOfManageTodo(
                todoBloc: todoBloc,
                todoPage: todoPage,
              );
            },
          );
        }
        return const Offstage();
      },
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Form(
            key: localTodoData.validatorKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: AnimatedScrollView(
              listAnimationType: ListAnimationType.None,
              padding: const EdgeInsets.only(
                bottom: 120,
                right: 16,
                left: 16,
                top: 60,
              ),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_getTitle, style: boldTextStyle(size: 28)),
                    ),
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
                      toast(
                        'Please select a date before the start-time',
                        bgColor: redColor,
                      );
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
                      toast(
                        'Please select a start time before the end-time.',
                        bgColor: redColor,
                      );
                    } else {
                      await util.selectEndTime(localTodoData.startTime!);
                    }
                  },
                ),
                ContentWidget(
                  title: 'Notes',
                  textFieldType: TextFieldType.MULTILINE,
                  lines: 5,
                  controller: localTodoData.note,
                  focusNode: localTodoData.notesNode,
                  textInputAction: TextInputAction.done,
                ),
                TaskDetailComponent<void>(localTodoData: localTodoData),
              ],
            ),
          ),
          if (!isKeyboardNotOpened)
            const Offstage()
          else
            Positioned(bottom: 16, left: 16, right: 16, child: buttonWidget),
        ],
      ),
    );
  }
}
