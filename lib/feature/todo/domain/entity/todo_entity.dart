class TodoEntity {
  int? todoId;
  String? firebaseTodoId;
  String? title;
  String? description;
  bool? isCompleted;
  DateTime? dueDate;

  /// priority: low, medium, high

  String? priority;
  int? assignedTo;
  String? tags;
  int? createdBy;
  int? updatedBy;

  /// status: pending, in progress, completed
  String? status;

  DateTime? reminder;
  String? attachment;
  String? category;
  int? estimatedTime;
  int? actualTime;
  bool? recurring;

  /// daily, weekly, monthly
  String? recurringFrequency;
  String? notes;
  DateTime? completedAt;
  String? colorCode;
  bool? isArchived;

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
