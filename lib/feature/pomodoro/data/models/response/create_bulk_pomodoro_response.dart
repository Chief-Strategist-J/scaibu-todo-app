class CreateBulkPomodoroResponse {
  CreateBulkPomodoroResponse({
    this.message,
    this.status,
    this.data,
  });

  CreateBulkPomodoroResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  Data? data;

  CreateBulkPomodoroResponse copyWith({
    String? message,
    bool? status,
    Data? data,
  }) =>
      CreateBulkPomodoroResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

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

class Data {
  Data({
    this.pomodoro,
    this.timers,
  });

  Data.fromJson(dynamic json) {
    pomodoro = json['pomodoro'] != null ? Pomodoro.fromJson(json['pomodoro']) : null;
    if (json['timers'] != null) {
      timers = [];
      json['timers'].forEach((v) {
        timers?.add(Timers.fromJson(v));
      });
    }
  }

  Pomodoro? pomodoro;
  List<Timers>? timers;

  Data copyWith({
    Pomodoro? pomodoro,
    List<Timers>? timers,
  }) =>
      Data(
        pomodoro: pomodoro ?? this.pomodoro,
        timers: timers ?? this.timers,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pomodoro != null) {
      map['pomodoro'] = pomodoro?.toJson();
    }
    if (timers != null) {
      map['timers'] = timers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Timers {
  Timers({
    this.id,
    this.pomodoroId,
  });

  Timers.fromJson(dynamic json) {
    id = json['id'];
    pomodoroId = json['pomodoro_id'];
  }

  num? id;
  num? pomodoroId;

  Timers copyWith({
    num? id,
    num? pomodoroId,
  }) =>
      Timers(
        id: id ?? this.id,
        pomodoroId: pomodoroId ?? this.pomodoroId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pomodoro_id'] = pomodoroId;
    return map;
  }
}

class Pomodoro {
  Pomodoro({
    this.uuid,
    this.userId,
    this.todoId,
    this.id,
  });

  Pomodoro.fromJson(dynamic json) {
    uuid = json['uuid'];
    userId = json['user_id'];
    todoId = json['todo_id'];
    id = json['id'];
  }

  String? uuid;
  num? userId;
  num? todoId;
  num? id;

  Pomodoro copyWith({
    String? uuid,
    num? userId,
    num? todoId,
    num? id,
  }) =>
      Pomodoro(
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        todoId: todoId ?? this.todoId,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['user_id'] = userId;
    map['todo_id'] = todoId;
    map['id'] = id;
    return map;
  }
}
