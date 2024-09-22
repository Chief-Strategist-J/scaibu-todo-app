import 'package:todo_app/core/app_library.dart';

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

  String priority;
  List<TagEntity> tags = [];
  List<ProjectEntity> project = [];

  final ValueNotifier<bool> isWantToDeleteTodoAtEndTimeNotifier;
  final ValueNotifier<int> pomodorowCount;
  final ValueNotifier<int> pomodorowDuration;

  bool isWantToDeleteTodoAtEndTime;
  final int numberOfPomodorowCount;
  final int numberOfPomodorowDuration;
  final bool isUpdatingExistingTodo;

  ManageTodoPageParam({
    this.firebaseTodoId,
    this.todoId,
    this.date,
    this.startTime,
    this.endTime,
    this.isUpdatingExistingTodo = false,
    this.isWantToDeleteTodoAtEndTime = true,
    this.priority = 'no_priority',
    this.tags = const [],
    this.project = const [],
    this.numberOfPomodorowCount = 0,
    this.numberOfPomodorowDuration = 0,
  })  : isWantToDeleteTodoAtEndTimeNotifier = ValueNotifier(isWantToDeleteTodoAtEndTime),
        pomodorowCount = ValueNotifier(numberOfPomodorowCount),
        pomodorowDuration = ValueNotifier(numberOfPomodorowDuration);

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

    log("DATA IS CLEARED FOR TODO-DETAIL");
  }

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
    param.priority = todoData.priority.validate(value: 'no_priority');

    return param;
  }
}
