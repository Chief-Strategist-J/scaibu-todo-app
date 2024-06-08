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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntity &&
          runtimeType == other.runtimeType &&
          todoId == other.todoId &&
          firebaseTodoId == other.firebaseTodoId &&
          title == other.title &&
          description == other.description &&
          isCompleted == other.isCompleted &&
          dueDate == other.dueDate &&
          priority == other.priority &&
          assignedTo == other.assignedTo &&
          tags == other.tags &&
          createdBy == other.createdBy &&
          updatedBy == other.updatedBy &&
          status == other.status &&
          reminder == other.reminder &&
          attachment == other.attachment &&
          category == other.category &&
          estimatedTime == other.estimatedTime &&
          actualTime == other.actualTime &&
          recurring == other.recurring &&
          recurringFrequency == other.recurringFrequency &&
          notes == other.notes &&
          completedAt == other.completedAt &&
          colorCode == other.colorCode &&
          isArchived == other.isArchived;

  @override
  int get hashCode =>
      todoId.hashCode ^
      firebaseTodoId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode ^
      dueDate.hashCode ^
      priority.hashCode ^
      assignedTo.hashCode ^
      tags.hashCode ^
      createdBy.hashCode ^
      updatedBy.hashCode ^
      status.hashCode ^
      reminder.hashCode ^
      attachment.hashCode ^
      category.hashCode ^
      estimatedTime.hashCode ^
      actualTime.hashCode ^
      recurring.hashCode ^
      recurringFrequency.hashCode ^
      notes.hashCode ^
      completedAt.hashCode ^
      colorCode.hashCode ^
      isArchived.hashCode;

  TodoEntity copyWith({
    int? todoId,
    String? firebaseTodoId,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dueDate,
    String? priority,
    int? assignedTo,
    String? tags,
    int? createdBy,
    int? updatedBy,
    String? status,
    DateTime? reminder,
    String? attachment,
    String? category,
    int? estimatedTime,
    int? actualTime,
    bool? recurring,
    String? recurringFrequency,
    String? notes,
    DateTime? completedAt,
    String? colorCode,
    bool? isArchived,
  }) {
    return TodoEntity(
      todoId: todoId ?? this.todoId,
      firebaseTodoId: firebaseTodoId ?? this.firebaseTodoId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      assignedTo: assignedTo ?? this.assignedTo,
      tags: tags ?? this.tags,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      status: status ?? this.status,
      reminder: reminder ?? this.reminder,
      attachment: attachment ?? this.attachment,
      category: category ?? this.category,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      actualTime: actualTime ?? this.actualTime,
      recurring: recurring ?? this.recurring,
      recurringFrequency: recurringFrequency ?? this.recurringFrequency,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
      colorCode: colorCode ?? this.colorCode,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}
