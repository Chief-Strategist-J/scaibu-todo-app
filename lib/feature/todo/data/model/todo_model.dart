import 'package:todo_app/core/app_library.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

/// Doc Required
mixin TodoEntityMixin {
  /// Doc Required

  int? get todoId;

  /// Doc Required

  String? get title;

  /// Doc Required

  String? get description;

  /// Doc Required
  bool? get isCompleted;

  /// Doc Required
  DateTime? get dueDate;

  /// Doc Required
  int? get priority;

  /// Doc Required
  String? get assignedTo;

  /// Doc Required
  List<String>? get tags; // Assuming tags is a List<String>
  /// Doc Required
  int? get createdBy;

  /// Doc Required
  int? get updatedBy;

  /// Doc Required
  String? get status;

  /// Doc Required
  DateTime? get reminder;

  /// Doc Required
  String? get attachment;

  /// Doc Required
  String? get category;

  /// Doc Required
  String? get estimatedTime;

  /// Doc Required
  String? get actualTime;

  /// Doc Required
  bool? get recurring;

  /// Doc Required
  String? get recurringFrequency;

  /// Doc Required
  String? get notes;

  /// Doc Required
  DateTime? get completedAt;

  /// Doc Required
  String? get colorCode;

  /// Doc Required
  bool? get isArchived;

  /// Doc Required
  String? get firebaseTodoId;

  /// Doc Required
  DateTime? get date;

  /// Doc Required
  DateTime? get startTime;

  /// Doc Required
  DateTime? get endTime;

  /// Doc Required
  List<String>? get tagNames;
}

/// Doc Required
@freezed
abstract class TodoModel with _$TodoModel, TodoEntityMixin { // Add this

  /// Doc is required
  const factory TodoModel({
    final int? todoId,
    final String? title,
    final String? description,
    final bool? isCompleted,
    final DateTime? dueDate,
    final int? priority,
    final String? assignedTo,
    final List<String>? tags,
    final int? createdBy,
    final int? updatedBy,
    final String? status,
    final DateTime? reminder,
    final String? attachment,
    final String? category,
    final String? estimatedTime,
    final String? actualTime,
    final bool? recurring,
    final String? recurringFrequency,
    final String? notes,
    final DateTime? completedAt,
    final String? colorCode,
    final bool? isArchived,
    final String? firebaseTodoId,
    final DateTime? date,
    final DateTime? startTime,
    final DateTime? endTime,
    final List<String>? tagNames,
  }) = _TodoModel;

  /// Doc Required
  const TodoModel._();

  /// Doc Required
  factory TodoModel.fromJson(final Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
