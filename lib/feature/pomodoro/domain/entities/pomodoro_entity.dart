import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_entity.freezed.dart';
part 'pomodoro_entity.g.dart';

@freezed
class PomodoroEntity with _$PomodoroEntity {
  const factory PomodoroEntity({
    String? uuid,
    String? title,
    String? description,
    int? duration,
    String? status,
    DateTime? startTime,
    DateTime? endTime,
    Map<String, dynamic>? metadata,
    String? priority,
    String? tags,
    bool? isCompleted,
    bool? isArchived,
    int? todoId,
    int? userId,
    int? projectId,
  }) = _PomodoroEntity;

  factory PomodoroEntity.fromJson(Map<String, dynamic> json) => _$PomodoroEntityFromJson(json);
}
