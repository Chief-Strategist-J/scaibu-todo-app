import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    int? todoId,
    String? firebaseTodoId,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dueDate,
    String? priority, // e.g., low, medium, high
    int? assignedTo,
    String? tags,
    int? createdBy,
    int? updatedBy,
    String? status, // e.g., pending, in progress, completed
    DateTime? reminder,
    String? attachment,
    String? category,
    int? estimatedTime,
    int? actualTime,
    bool? recurring,
    String? recurringFrequency, // e.g., daily, weekly, monthly
    String? notes,
    DateTime? completedAt,
    String? colorCode,
    bool? isArchived,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? date,
    List<String>? tagNames,
  }) = _TodoEntity;



  factory TodoEntity.fromJson(Map<String, dynamic> json) => _$TodoEntityFromJson(json);
}

