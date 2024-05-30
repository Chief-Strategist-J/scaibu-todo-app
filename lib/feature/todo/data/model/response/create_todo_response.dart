class CreateTodoResponse {
  CreateTodoResponse({
    this.message,
    this.status,
    this.data,
  });

  CreateTodoResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? TodoData.fromJson(json['data']) : null;
  }
  String? message;
  bool? status;
  TodoData? data;
  CreateTodoResponse copyWith({
    String? message,
    bool? status,
    TodoData? data,
  }) {
    return CreateTodoResponse(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class TodoData {
  TodoData({
    this.id,
    this.title,
    this.description,
    this.notes,
  });

  TodoData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    notes = json['notes'];
  }
  num? id;
  String? title;
  String? description;
  String? notes;
  TodoData copyWith({
    num? id,
    String? title,
    String? description,
    String? notes,
  }) {
    return TodoData(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['notes'] = notes;

    return map;
  }
}
