class TodoListResponse {
  TodoListResponse({
    this.message,
    this.status,
    this.data,
  });

  TodoListResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  String? message;
  bool? status;
  List<Data>? data;

  TodoListResponse copyWith({
    String? message,
    bool? status,
    List<Data>? data,
  }) =>
      TodoListResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
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

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    notes = json['notes'];
    createdBy = json['created_by'];
    firebaseTodoId = json['firebase_todo_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    date = json['date'];
    description = json['description'];
    priority = json['priority'];
    tagNames = json['tag_names'] != null ? json['tag_names'].cast<String>() : [];
  }

  num? id;
  String? title;
  String? notes;
  num? createdBy;
  dynamic firebaseTodoId;
  String? startTime;
  String? endTime;
  String? date;
  String? description;
  String? priority;
  List<String>? tagNames;

  Data copyWith({
    num? id,
    String? title,
    String? notes,
    num? createdBy,
    dynamic firebaseTodoId,
    String? startTime,
    String? endTime,
    String? date,
    String? description,
    String? priority,
    List<String>? tagNames,
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
