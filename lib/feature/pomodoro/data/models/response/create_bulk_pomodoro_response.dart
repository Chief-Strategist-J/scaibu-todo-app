/// Doc Required
class CreateBulkPomodoroResponse {
  /// Doc Required

  CreateBulkPomodoroResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required

  CreateBulkPomodoroResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String?;
    status = dataMap['status'] as bool?;
    data = dataMap['data'] != null ? Data.fromJson(dataMap['data']) : null;
  }

  /// Doc Required

  String? message;

  /// Doc Required

  bool? status;

  /// Doc Required

  Data? data;

  /// Doc Required

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

  /// Doc Required

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

/// Doc Required

class Data {
  /// Doc Required

  Data({
    this.pomodoro,
    this.timers,
  });

  /// Doc Required
  Data.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    pomodoro = dataMap['pomodoro'] != null
        ? Pomodoro.fromJson(dataMap['pomodoro'])
        : null;

    if (dataMap['timers'] != null) {
      timers = <Timers>[];
      for (final dynamic v in (dataMap['timers'] as List<dynamic>)) {
        timers?.add(Timers.fromJson(v));
      }
    }
  }

  /// Doc Required

  Pomodoro? pomodoro;

  /// Doc Required

  List<Timers>? timers;

  /// Doc Required

  Data copyWith({
    final Pomodoro? pomodoro,
    final List<Timers>? timers,
  }) =>
      Data(
        pomodoro: pomodoro ?? this.pomodoro,
        timers: timers ?? this.timers,
      );

  /// Doc Required

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

/// Doc Required

class Timers {
  /// Doc Required

  Timers({
    this.id,
    this.pomodoroId,
  });

  /// Doc Required

  Timers.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    id = dataMap['id'] as num?;
    pomodoroId = dataMap['pomodoro_id'] as num?;
  }

  /// Doc Required

  num? id;

  /// Doc Required

  num? pomodoroId;

  /// Doc Required

  Timers copyWith({
    final num? id,
    final num? pomodoroId,
  }) =>
      Timers(
        id: id ?? this.id,
        pomodoroId: pomodoroId ?? this.pomodoroId,
      );

  /// Doc Required

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['pomodoro_id'] = pomodoroId;
    return map;
  }
}

/// Doc Required

class Pomodoro {
  /// Doc Required

  Pomodoro({
    this.uuid,
    this.userId,
    this.todoId,
    this.id,
  });

  /// Doc Required

  Pomodoro.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    uuid = dataMap['uuid'] as String?;
    userId = dataMap['user_id'] as num?;
    todoId = dataMap['todo_id'] as num?;
    id = dataMap['id'] as num?;
  }

  /// Doc Required

  String? uuid;

  /// Doc Required

  num? userId;

  /// Doc Required

  num? todoId;

  /// Doc Required

  num? id;

  /// Doc Required
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

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['user_id'] = userId;
    map['todo_id'] = todoId;
    map['id'] = id;
    return map;
  }
}
