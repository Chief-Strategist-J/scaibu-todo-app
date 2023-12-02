class ToDo {
  String taskPriority;
  String taskTitle;
  String taskDescription;
  String selectedDate;

  ToDo({
    required this.taskPriority,
    required this.taskTitle,
    required this.taskDescription,
    required this.selectedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'taskPriority': taskPriority,
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'selectedDate': selectedDate,
    };
  }
}
