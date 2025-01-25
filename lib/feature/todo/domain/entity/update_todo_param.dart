/// Doc Required
class UpdateTodoParam {
  /// Doc Required
  UpdateTodoParam({
    required this.todoData,
    required this.firebaseID,
    required this.localID,
  });

  /// Doc Required
  final Map<String, dynamic> todoData;

  /// Doc Required
  final String firebaseID;

  /// Doc Required
  final String localID;
}
