class TodoEntity {
  final int? todoId;
  final String? firebaseTodoId;
  final String? title;
  final String? description;
  final bool? isCompleted;
  final DateTime? dueDate;

  /// priority: low, medium, high

  final String? priority;
  final int? assignedTo;
  final String? tags;
  final int? createdBy;
  final int? updatedBy;

  /// status: pending, in progress, completed
  final String? status;

  final DateTime? reminder;
  final String? attachment;
  final String? category;
  final int? estimatedTime;
  final int? actualTime;
  final bool? recurring;

  /// daily, weekly, monthly
  final String? recurringFrequency;
  final String? notes;
  final DateTime? completedAt;
  final String? colorCode;
  final bool? isArchived;

  TodoEntity({
    this.firebaseTodoId,
    this.todoId,
    this.title,
    this.description,
    this.isCompleted,
    this.dueDate,
    this.priority,
    this.assignedTo,
    this.tags,
    this.createdBy,
    this.updatedBy,
    this.status,
    this.reminder,
    this.attachment,
    this.category,
    this.estimatedTime,
    this.actualTime,
    this.recurring,
    this.recurringFrequency,
    this.notes,
    this.completedAt,
    this.colorCode,
    this.isArchived,
  });
}
