/// Doc Required
class CreateTodoResponse {
  /// Doc Required
  CreateTodoResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  CreateTodoResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String?;
    status = dataMap['status'] as bool?;
    data = dataMap['data'] != null ? TodoData.fromJson(dataMap['data']) : null;
  }

  /// Doc Required
  String? message;

  /// Doc Required
  bool? status;

  /// Doc Required
  TodoData? data;

  /// Doc Required
  CreateTodoResponse copyWith({
    final String? message,
    final bool? status,
    final TodoData? data,
  }) =>
      CreateTodoResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    /// Doc Required
    final Map<String, dynamic> map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
/// Doc Required
class TodoData {
  /// Doc Required
  TodoData({
    this.id,
    this.title,
    this.description,
    this.notes,
  });

  /// Doc Required
  TodoData.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    id = dataMap['id'] as num?;
    title = dataMap['title'] as String?;
    description = dataMap['description'] as String?;
    notes = dataMap['notes'] as String?;
  }

  /// Doc Required
  num? id;

  /// Doc Required
  String? title;

  /// Doc Required
  String? description;

  /// Doc Required
  String? notes;

  /// Doc Required
  TodoData copyWith({
    final num? id,
    final String? title,
    final String? description,
    final String? notes,
  }) =>
      TodoData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        notes: notes ?? this.notes,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['notes'] = notes;

    return map;
  }
}
