import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_entity.freezed.dart';
part 'pomodoro_entity.g.dart';

@freezed
class PomodoroEntity with _$PomodoroEntity {
  const factory PomodoroEntity({
    final String? uuid,
    final String? title,
    final String? description,
    final int? duration,
    final String? status,
    final DateTime? startTime,
    final DateTime? endTime,
    final Map<String, dynamic>? metadata,
    final String? priority,
    final String? tags,
    final bool? isCompleted,
    final bool? isArchived,
    final int? todoId,
    final int? userId,
    final int? projectId,
  }) = _PomodoroEntity;

  factory PomodoroEntity.fromJson(final Map<String, dynamic> json) =>
      _$PomodoroEntityFromJson(json);
}
