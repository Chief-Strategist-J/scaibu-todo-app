import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_model.freezed.dart';
part 'pomodoro_model.g.dart';

mixin PomodoroModelMixin {
  String? get uuid;

  String? get title;

  String? get description;

  int? get duration;

  String? get status;

  DateTime? get startTime;

  DateTime? get endTime;

  Map<String, dynamic>? get metadata;

  String? get priority;

  String? get tags;

  bool? get isCompleted;

  bool? get isArchived;

  int? get todoId;

  int? get userId;

  int? get projectId;
}

@freezed
class PomodoroModel with _$PomodoroModel, PomodoroModelMixin {
  const factory PomodoroModel({
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
  }) = _PomodoroModel;

  factory PomodoroModel.fromJson(final Map<String, dynamic> json) =>
      _$PomodoroModelFromJson(json);
}
