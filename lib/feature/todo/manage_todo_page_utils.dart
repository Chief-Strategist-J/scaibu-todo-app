import 'package:todo_app/core/app_library.dart';

class ManageTodoPageUtils {
  final BuildContext ctx;
  final ManageTodoPageParam param;

  ManageTodoPageUtils(this.ctx, this.param);

  void dispose() {
    log("DATA IS CLEARED FOR TODO-DETAIL IN MANAGE TODO PAGE UTILS");
    param.dispose();
  }

  static bool _isLoadingState(TodoBloc todoBloc) => todoBloc.state is LoadingState;

  bool _isValidTodoDetail() {
    return param.validatorKey.currentState!.validate();
  }

  Future<void> _updateExistingTodo(TodoBloc todoBloc) async {
    await todoBloc.onEditPageUpdateTodo(param).then((_) {
      if (ctx.mounted) GoRouter.of(ctx).go(ApplicationPaths.todoListViewPage);
    });
  }

  static bool _isUpdatingExisting(ManageTodoPageParam? todoPage) {
    return todoPage != null && (todoPage.isUpdatingExistingTodo);
  }

  Future<void> _handleNewTodoCreation(TodoBloc todoBloc) async {
    final isWantToDelete = await _getDeleteConfirmation(ctx);
    param.isWantToDeleteTodoAtEndTime = isWantToDelete;
    param.isWantToDeleteTodoAtEndTimeNotifier.value = isWantToDelete;

    await todoBloc.createTodo(todoDetail: param).then((_) async {
      if (ctx.mounted) {
        GoRouter.of(ctx).go(ApplicationPaths.todoListViewPage);
        await Future.delayed(const Duration(milliseconds: 1000), () => param.dispose());
      }
    });
  }

  static Future<bool> _getDeleteConfirmation(BuildContext context) async {
    final confirmation = await appShowConfirmDialogCustom(
      context,
      title: "Want to delete todo at end time?",
      dialogType: DialogType.DELETE,
      backgroundColor: context.primaryColor,
      cancelButtonColor: cancelButtonColor,
      negativeTextColor: context.primaryColor,
      positiveText: "Delete",
      onAccept: (_) => true,
      onCancel: (_) => false,
    );
    return confirmation.validate();
  }

  static bool _showToastAndReturnFalse(String message) {
    toast(message);
    return false;
  }

  static bool _isValidSelectedDate(BuildContext ctx, TimeServiceModel date) {
    if (!date.isSelected) return false;

    final now = DateTime.now();
    final bool isValidDate = date.dateTime.isAfter(DateTime(now.year, now.month, now.day - 1));

    if (!ctx.mounted) return false;
    if (!isValidDate) {
      toast("Select a valid date, not one that has passed.", bgColor: redColor);
      return false;
    }
    return true;
  }

  bool _isValidStartTime(TimeServiceModel startTime) {
    if (!startTime.isSelected || !ctx.mounted) return false;

    final bool isValidStartTime = startTime.dateTime.isAfter(DateTime.now());
    if (!isValidStartTime) {
      toast("Choose a valid start time,\n not past.", bgColor: redColor);
      return false;
    }
    return true;
  }

  bool _isValidEndTime(TimeServiceModel endTime, TimeServiceModel startTime) {
    if (!endTime.isSelected || !ctx.mounted) return false;

    final bool endTimeIsAfterStartTime = endTime.dateTime.isAfter(startTime.dateTime);
    if (!endTimeIsAfterStartTime) {
      toast("End time must be after start time.\n Please retry.", bgColor: redColor);
      return false;
    }
    return true;
  }

  Future<bool> onTapOfManageTodo({
    required TodoBloc todoBloc,
    required ManageTodoPageParam? todoPage,
  }) async {
    if (_isLoadingState(todoBloc)) return _showToastAndReturnFalse("Loading please wait ...");
    if (!_isValidTodoDetail()) return _showToastAndReturnFalse('field_must_be_validated'.tr());

    if (_isUpdatingExisting(todoPage)) {
      await _updateExistingTodo(todoBloc);
    } else {
      await _handleNewTodoCreation(todoBloc);
    }
    return true;
  }

  Future<void> selectDateAndTime() async {
    await timeService.selectDate(ctx).then((date) async {
      if (!ctx.mounted) return;

      if (_isValidSelectedDate(ctx, date)) {
        param.date = date;
        param.dateController.text = date.formatTimeInString;
        await selectStartAndEndTime();
      }
    });
  }

  Future<void> selectStartAndEndTime() async {
    await timeService.selectTime(ctx).then((startTime) async {
      if (!ctx.mounted) return;

      if (_isValidStartTime(startTime)) {
        param.startTime = startTime;
        param.startTimeController.text = startTime.formatTimeInString;
        await selectEndTime(startTime);
      }
    });
  }

  Future<void> selectEndTime(
    TimeServiceModel startTime,
  ) async {
    await timeService.selectTime(ctx).then((endTime) async {
      if (!ctx.mounted) return;

      if (_isValidEndTime(endTime, startTime)) {
        param.endTime = endTime;
        param.endTimeController.text = endTime.formatTimeInString;
      }
    });
  }
}
