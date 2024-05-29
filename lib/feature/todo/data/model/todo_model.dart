import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    required super.todoId,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.dueDate,
    required super.priority,
    required super.assignedTo,
    required super.tags,
    required super.createdBy,
    required super.updatedBy,
    required super.status,
    required super.reminder,
    required super.attachment,
    required super.category,
    required super.estimatedTime,
    required super.actualTime,
    required super.recurring,
    required super.recurringFrequency,
    required super.notes,
    required super.completedAt,
    required super.colorCode,
    required super.isArchived,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      todoId: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],
      dueDate: json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
      priority: json['priority'],
      assignedTo: json['assigned_to'],
      tags: json['tags'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      status: json['status'],
      reminder: json['reminder'] != null ? DateTime.parse(json['reminder']) : null,
      attachment: json['attachment'],
      category: json['category'],
      estimatedTime: json['estimated_time'],
      actualTime: json['actual_time'],
      recurring: json['recurring'],
      recurringFrequency: json['recurring_frequency'],
      notes: json['notes'],
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at']) : null,
      colorCode: json['color_code'],
      isArchived: json['is_archived'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': todoId,
      'title': title,
      'description': description,
      'is_completed': isCompleted,
      'due_date': dueDate.toString(),
      'priority': priority,
      'assigned_to': assignedTo,
      'tags': tags,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'status': status,
      'reminder': reminder.toString(),
      'attachment': attachment,
      'category': category,
      'estimated_time': estimatedTime,
      'actual_time': actualTime,
      'recurring': recurring,
      'recurring_frequency': recurringFrequency,
      'notes': notes,
      'completed_at': completedAt.toString(),
      'color_code': colorCode,
      'is_archived': isArchived,
    };
  }
}
