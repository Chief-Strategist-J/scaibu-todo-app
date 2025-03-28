import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ManageTodoPageParam {
  /// Doc Required
  ManageTodoPageParam({
    this.firebaseTodoId,
    this.todoId,
    this.date,
    this.startTime,
    this.endTime,
    this.isUpdatingExistingTodo = false,
    this.isWantToDeleteTodoAtEndTime = true,
    this.priority = 'no_priority',
    this.tags = const <TagEntity>[],
    this.project = const <ProjectEntity>[],
    this.numberOfPomodorowCount = 0,
    this.numberOfPomodorowDuration = 0,
  })  : isWantToDeleteTodoAtEndTimeNotifier =
            ValueNotifier<bool>(isWantToDeleteTodoAtEndTime),
        pomodorowCount = ValueNotifier<int>(numberOfPomodorowCount),
        pomodorowDuration = ValueNotifier<int>(numberOfPomodorowDuration);

  /// Doc Required
  factory ManageTodoPageParam.fromTodoEntity(
    final TodoEntity todoData, {
    final bool isUpdatingExistingTodo = true,
  }) {
    final ManageTodoPageParam param = ManageTodoPageParam(
      firebaseTodoId: todoData.firebaseTodoId.validate(),
      todoId: todoData.todoId.validate().toString(),
      isUpdatingExistingTodo: isUpdatingExistingTodo,
    );

    if (todoData.date != null) {
      param.dateController.text = timeService.convertToDate(todoData.date!);
    }
    if (todoData.startTime != null) {
      param.startTimeController.text =
          timeService.convertToTime(todoData.startTime!);
    }
    if (todoData.endTime != null) {
      param.endTimeController.text =
          timeService.convertToTime(todoData.endTime!);
    }

    param.note.text = todoData.notes.validate();
    param.title.text = todoData.title.validate();
    param.description.text = todoData.description.validate();
    param.priority = todoData.priority.validate(value: 'no_priority');

    return param;
  }

  /// Doc Required
  final FocusNode titleNode = FocusNode();

  /// Doc Required
  final FocusNode dateNode = FocusNode();

  /// Doc Required
  final FocusNode startTimeNode = FocusNode();

  /// Doc Required
  final FocusNode endTimeNode = FocusNode();

  /// Doc Required
  final FocusNode descriptionNode = FocusNode();

  /// Doc Required
  final FocusNode notesNode = FocusNode();

  /// Doc Required
  final GlobalKey<FormState> validatorKey = GlobalKey<FormState>();

  /// Doc Required
  final TextEditingController title = TextEditingController(text: 'Task');

  /// Doc Required
  final TextEditingController description = TextEditingController(text: '-');

  /// Doc Required
  final TextEditingController dateController = TextEditingController();

  /// Doc Required
  final TextEditingController startTimeController = TextEditingController();

  /// Doc Required
  final TextEditingController endTimeController = TextEditingController();

  /// Doc Required
  final TextEditingController note = TextEditingController();

  /// Doc Required
  TimeServiceModel? date;

  /// Doc Required
  TimeServiceModel? startTime;

  /// Doc Required
  TimeServiceModel? endTime;

  /// Doc Required
  final String? firebaseTodoId;

  /// Doc Required
  final String? todoId;

  /// Doc Required
  String priority;

  /// Doc Required
  List<TagEntity> tags = <TagEntity>[];

  /// Doc Required
  List<ProjectEntity> project = <ProjectEntity>[];

  /// Doc Required
  final ValueNotifier<bool> isWantToDeleteTodoAtEndTimeNotifier;

  /// Doc Required
  final ValueNotifier<int> pomodorowCount;

  /// Doc Required
  final ValueNotifier<int> pomodorowDuration;

  /// Doc Required
  bool isWantToDeleteTodoAtEndTime;

  /// Doc Required
  final int numberOfPomodorowCount;

  /// Doc Required
  final int numberOfPomodorowDuration;

  /// Doc Required
  final bool isUpdatingExistingTodo;

  /// Doc Required
  void dispose() {
    tags.clear();
    title.clear();
    description.clear();
    dateController.clear();
    startTimeController.clear();
    endTimeController.clear();
    note.clear();

    titleNode.dispose();
    dateNode.dispose();
    startTimeNode.dispose();
    endTimeNode.dispose();
    descriptionNode.dispose();
    notesNode.dispose();

    title.dispose();
    description.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    note.dispose();

    isWantToDeleteTodoAtEndTimeNotifier.dispose();
    pomodorowCount.dispose();
    pomodorowDuration.dispose();

    log('DATA IS CLEARED FOR TODO-DETAIL');
  }
}
