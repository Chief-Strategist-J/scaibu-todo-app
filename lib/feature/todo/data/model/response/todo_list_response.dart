/// message : "done"
/// status : true
/// data : [{"id":2,"title":"Test","description":"Done","notes":"notes","firebase_todo_id":"K5pxiGp3AL8ZIID5rcUB"}]

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

/// id : 2
/// title : "Test"
/// description : "Done"
/// notes : "notes"
/// firebase_todo_id : "K5pxiGp3AL8ZIID5rcUB"

class Data {
  Data({
    this.id,
    this.title,
    this.description,
    this.notes,
    this.firebaseTodoId,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    notes = json['notes'];
    firebaseTodoId = json['firebase_todo_id'];
  }

  num? id;
  String? title;
  String? description;
  String? notes;
  String? firebaseTodoId;

  Data copyWith({
    num? id,
    String? title,
    String? description,
    String? notes,
    String? firebaseTodoId,
  }) =>
      Data(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        notes: notes ?? this.notes,
        firebaseTodoId: firebaseTodoId ?? this.firebaseTodoId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['notes'] = notes;
    map['firebase_todo_id'] = firebaseTodoId;
    return map;
  }
}
