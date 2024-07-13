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
    this.startTime,
    this.endTime,
    this.date,
    this.createdBy,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    notes = json['notes'];
    firebaseTodoId = json['firebase_todo_id'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdBy = json['created_by'] ?? -1;
  }

  num? id;
  num? createdBy;
  String? title;
  String? description;
  String? notes;
  String? firebaseTodoId;
  String? date;
  String? startTime;
  String? endTime;

  Data copyWith({
    num? id,
    String? title,
    String? description,
    String? notes,
    String? firebaseTodoId,
    String? date,
    String? startTime,
    String? endTime,
    num? createdBy,
  }) {
    return Data(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      firebaseTodoId: firebaseTodoId ?? this.firebaseTodoId,
      date: date ?? this.date,
      endTime: endTime ?? this.endTime,
      startTime: startTime ?? this.startTime,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['notes'] = notes;
    map['firebase_todo_id'] = firebaseTodoId;
    map['date'] = date;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    map['created_by'] = createdBy;
    return map;
  }
}
