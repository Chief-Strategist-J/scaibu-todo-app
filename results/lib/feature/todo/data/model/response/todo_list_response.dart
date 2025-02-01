/// Doc Required
class TodoListResponse {
  /// Doc Required
  TodoListResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  TodoListResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String? ?? '';
    status = dataMap['status'] as bool? ?? false;

    if (dataMap['data'] != null) {
      data = <Data>[];
      final List<dynamic> dataList = dataMap['data'] as List<dynamic>;
      for (int i = 0; i < dataList.length; i++) {
        final dynamic v = dataList[i];
        data?.add(Data.fromJson(v));
      }
    }
  }

  /// Doc Required
  String? message;

  /// Doc Required
  bool? status;

  /// Doc Required

  List<Data>? data;

  /// Doc Required
  TodoListResponse copyWith({
    final String? message,
    final bool? status,
    final List<Data>? data,
  }) =>
      TodoListResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((final Data v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Doc Required
class Data {
  /// Doc Required
  Data({
    this.id,
    this.title,
    this.notes,
    this.createdBy,
    this.firebaseTodoId,
    this.startTime,
    this.endTime,
    this.date,
    this.description,
    this.priority,
    this.tagNames,
  });

  /// Doc Required
  Data.fromJson(final dynamic json) {
    final Map<String, dynamic> data = json as Map<String, dynamic>;

    id = data['id'] as num?;
    title = data['title'] as String?;
    notes = data['notes'] as String?;
    createdBy = data['created_by'] as num?;
    firebaseTodoId = data['firebase_todo_id'];
    startTime = data['start_time'] as String?;
    endTime = data['end_time'] as String?;
    date = data['date'] as String?;
    description = data['description'] as String?;
    priority = data['priority'] as String?;
    tagNames = data['tag_names'] != null
        ? List<String>.from(data['tag_names'] as List<String>)
        : <String>[];
  }

  /// Doc Required
  num? id;

  /// Doc Required
  String? title;

  /// Doc Required
  String? notes;

  /// Doc Required
  num? createdBy;

  /// Doc Required
  dynamic firebaseTodoId;

  /// Doc Required
  String? startTime;

  /// Doc Required
  String? endTime;

  /// Doc Required
  String? date;

  /// Doc Required
  String? description;

  /// Doc Required
  String? priority;

  /// Doc Required
  List<String>? tagNames;

  /// Doc Required
  Data copyWith({
    final num? id,
    final String? title,
    final String? notes,
    final num? createdBy,
    final dynamic firebaseTodoId,
    final String? startTime,
    final String? endTime,
    final String? date,
    final String? description,
    final String? priority,
    final List<String>? tagNames,
  }) =>
      Data(
        id: id ?? this.id,
        title: title ?? this.title,
        notes: notes ?? this.notes,
        createdBy: createdBy ?? this.createdBy,
        firebaseTodoId: firebaseTodoId ?? this.firebaseTodoId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        date: date ?? this.date ?? '',
        description: description ?? this.description,
        priority: priority ?? this.priority,
        tagNames: tagNames ?? this.tagNames,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['notes'] = notes;
    map['created_by'] = createdBy;
    map['firebase_todo_id'] = firebaseTodoId;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    map['date'] = date ?? '';
    map['description'] = description;
    map['priority'] = priority;
    map['tag_names'] = tagNames;
    return map;
  }
}
