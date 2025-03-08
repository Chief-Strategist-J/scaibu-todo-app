import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_model.freezed.dart';

part 'pomodoro_model.g.dart';

/// Doc Required
mixin PomodoroModelMixin {
  /// Doc Required

  String? get uuid;

  /// Doc Required

  String? get title;

  /// Doc Required

  String? get description;

  /// Doc Required

  int? get duration;

  /// Doc Required

  String? get status;

  /// Doc Required

  DateTime? get startTime;

  /// Doc Required

  DateTime? get endTime;

  /// Doc Required

  Map<String, dynamic>? get metadata;

  /// Doc Required

  String? get priority;

  /// Doc Required

  String? get tags;

  /// Doc Required

  bool? get isCompleted;

  /// Doc Required

  bool? get isArchived;

  /// Doc Required

  int? get todoId;

  /// Doc Required

  int? get userId;

  /// Doc Required

  int? get projectId;
}

/// Doc Required

@freezed
abstract class PomodoroModel with _$PomodoroModel, PomodoroModelMixin {
  /// Doc Required

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

  const PomodoroModel._();

  /// Doc Required

  factory PomodoroModel.fromJson(final Map<String, dynamic> json) =>
      _$PomodoroModelFromJson(json);
}
