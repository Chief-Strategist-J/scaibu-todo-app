class CreateBulkPomodoroResponse {
  CreateBulkPomodoroResponse({
    this.message,
    this.status,
    this.data,
  });

  CreateBulkPomodoroResponse.fromJson(final dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  Data? data;

  CreateBulkPomodoroResponse copyWith({
    final String? message,
    final bool? status,
    final Data? data,
  }) =>
      CreateBulkPomodoroResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
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

  Data.fromJson(final dynamic json) {
    pomodoro =
        json['pomodoro'] != null ? Pomodoro.fromJson(json['pomodoro']) : null;
    if (json['timers'] != null) {
      timers = <Timers>[];
      json['timers'].forEach((final v) {
        timers?.add(Timers.fromJson(v));
      });
    }
  }

  Pomodoro? pomodoro;
  List<Timers>? timers;

  Data copyWith({
    final Pomodoro? pomodoro,
    final List<Timers>? timers,
  }) =>
      Data(
        pomodoro: pomodoro ?? this.pomodoro,
        timers: timers ?? this.timers,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (pomodoro != null) {
      map['pomodoro'] = pomodoro?.toJson();
    }
    if (timers != null) {
      map['timers'] = timers?.map((final Timers v) => v.toJson()).toList();
    }
    return map;
  }
}

class Timers {
  Timers({
    this.id,
    this.pomodoroId,
  });

  Timers.fromJson(final dynamic json) {
    id = json['id'];
    pomodoroId = json['pomodoro_id'];
  }

  num? id;
  num? pomodoroId;

  Timers copyWith({
    final num? id,
    final num? pomodoroId,
  }) =>
      Timers(
        id: id ?? this.id,
        pomodoroId: pomodoroId ?? this.pomodoroId,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
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

  Pomodoro.fromJson(final dynamic json) {
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
    final String? uuid,
    final num? userId,
    final num? todoId,
    final num? id,
  }) =>
      Pomodoro(
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        todoId: todoId ?? this.todoId,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['user_id'] = userId;
    map['todo_id'] = todoId;
    map['id'] = id;
    return map;
  }
}
