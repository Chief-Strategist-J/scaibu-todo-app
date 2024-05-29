class TodoEntity {
  final int todoId;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? dueDate;
  final String priority;

  /// priority: low, medium, high
  final int assignedTo;
  final String tags;
  final int createdBy;
  final int updatedBy;
  final String status;

  /// status: pending, in progress, completed
  final DateTime? reminder;
  final String attachment;
  final String category;
  final int estimatedTime;
  final int actualTime;
  final bool recurring;
  final String recurringFrequency;

  /// daily, weekly, monthly
  final String notes;
  final DateTime? completedAt;
  final String colorCode;
  final bool isArchived;

  TodoEntity({
    required this.todoId,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.dueDate,
    required this.priority,
    required this.assignedTo,
    required this.tags,
    required this.createdBy,
    required this.updatedBy,
    required this.status,
    required this.reminder,
    required this.attachment,
    required this.category,
    required this.estimatedTime,
    required this.actualTime,
    required this.recurring,
    required this.recurringFrequency,
    required this.notes,
    required this.completedAt,
    required this.colorCode,
    required this.isArchived,
  });
}
