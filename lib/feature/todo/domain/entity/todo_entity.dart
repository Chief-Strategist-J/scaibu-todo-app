import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

/// Doc Required
@freezed
abstract class TodoEntity with _$TodoEntity {
  /// Doc Required
  const factory TodoEntity({
    final int? todoId,
    final String? firebaseTodoId,
    final String? title,
    final String? description,
    final bool? isCompleted,
    final DateTime? dueDate,
    final String? priority, // e.g., low, medium, high
    final int? assignedTo,
    final String? tags,
    final int? createdBy,
    final int? updatedBy,
    final String? status, // e.g., pending, in progress, completed
    final DateTime? reminder,
    final String? attachment,
    final String? category,
    final int? estimatedTime,
    final int? actualTime,
    final bool? recurring,
    final String? recurringFrequency, // e.g., daily, weekly, monthly
    final String? notes,
    final DateTime? completedAt,
    final String? colorCode,
    final bool? isArchived,
    final DateTime? startTime,
    final DateTime? endTime,
    final DateTime? date,
    final List<String>? tagNames,
  }) = _TodoEntity;

  /// Doc Required
  factory TodoEntity.fromJson(final Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);
}
