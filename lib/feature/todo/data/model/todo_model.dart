import 'package:todo_app/core/app_library.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

mixin TodoEntityMixin {
  int? get todoId;

  String? get title;

  String? get description;

  bool? get isCompleted;

  DateTime? get dueDate;

  int? get priority;

  String? get assignedTo;

  List<String>? get tags; // Assuming tags is a List<String>
  int? get createdBy;

  int? get updatedBy;

  String? get status;

  DateTime? get reminder;

  String? get attachment;

  String? get category;

  String? get estimatedTime;

  String? get actualTime;

  bool? get recurring;

  String? get recurringFrequency;

  String? get notes;

  DateTime? get completedAt;

  String? get colorCode;

  bool? get isArchived;

  String? get firebaseTodoId;

  DateTime? get date;

  DateTime? get startTime;

  DateTime? get endTime;

  List<String>? get tagNames;
}

@freezed
class TodoModel with _$TodoModel, TodoEntityMixin {
  const factory TodoModel({
    int? todoId,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dueDate,
    int? priority,
    String? assignedTo,
    List<String>? tags,
    int? createdBy,
    int? updatedBy,
    String? status,
    DateTime? reminder,
    String? attachment,
    String? category,
    String? estimatedTime,
    String? actualTime,
    bool? recurring,
    String? recurringFrequency,
    String? notes,
    DateTime? completedAt,
    String? colorCode,
    bool? isArchived,
    String? firebaseTodoId,
    DateTime? date,
    DateTime? startTime,
    DateTime? endTime,
    List<String>? tagNames,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
