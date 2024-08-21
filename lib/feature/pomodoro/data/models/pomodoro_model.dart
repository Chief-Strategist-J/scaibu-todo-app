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
  }) = _PomodoroModel;

  factory PomodoroModel.fromJson(Map<String, dynamic> json) => _$PomodoroModelFromJson(json);
}
