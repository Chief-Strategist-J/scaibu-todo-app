// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PomodoroModelImpl _$$PomodoroModelImplFromJson(Map<String, dynamic> json) =>
    _$PomodoroModelImpl(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      status: json['status'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      priority: json['priority'] as String?,
      tags: json['tags'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      isArchived: json['isArchived'] as bool?,
      todoId: (json['todoId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PomodoroModelImplToJson(_$PomodoroModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'status': instance.status,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'metadata': instance.metadata,
      'priority': instance.priority,
      'tags': instance.tags,
      'isCompleted': instance.isCompleted,
      'isArchived': instance.isArchived,
      'todoId': instance.todoId,
      'userId': instance.userId,
      'projectId': instance.projectId,
    };
