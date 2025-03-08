// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => _TodoModel(
      todoId: (json['todoId'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      priority: (json['priority'] as num?)?.toInt(),
      assignedTo: json['assignedTo'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdBy: (json['createdBy'] as num?)?.toInt(),
      updatedBy: (json['updatedBy'] as num?)?.toInt(),
      status: json['status'] as String?,
      reminder: json['reminder'] == null
          ? null
          : DateTime.parse(json['reminder'] as String),
      attachment: json['attachment'] as String?,
      category: json['category'] as String?,
      estimatedTime: json['estimatedTime'] as String?,
      actualTime: json['actualTime'] as String?,
      recurring: json['recurring'] as bool?,
      recurringFrequency: json['recurringFrequency'] as String?,
      notes: json['notes'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      colorCode: json['colorCode'] as String?,
      isArchived: json['isArchived'] as bool?,
      firebaseTodoId: json['firebaseTodoId'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      tagNames: (json['tagNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TodoModelToJson(_TodoModel instance) =>
    <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'dueDate': instance.dueDate?.toIso8601String(),
      'priority': instance.priority,
      'assignedTo': instance.assignedTo,
      'tags': instance.tags,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'status': instance.status,
      'reminder': instance.reminder?.toIso8601String(),
      'attachment': instance.attachment,
      'category': instance.category,
      'estimatedTime': instance.estimatedTime,
      'actualTime': instance.actualTime,
      'recurring': instance.recurring,
      'recurringFrequency': instance.recurringFrequency,
      'notes': instance.notes,
      'completedAt': instance.completedAt?.toIso8601String(),
      'colorCode': instance.colorCode,
      'isArchived': instance.isArchived,
      'firebaseTodoId': instance.firebaseTodoId,
      'date': instance.date?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'tagNames': instance.tagNames,
    };
