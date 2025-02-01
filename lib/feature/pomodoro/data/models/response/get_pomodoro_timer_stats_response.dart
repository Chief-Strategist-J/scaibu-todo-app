/// Doc Required
class GetPomodoroTimerStatsResponse {
  /// Doc Required
  GetPomodoroTimerStatsResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  GetPomodoroTimerStatsResponse.fromJson(final dynamic json) {
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
  GetPomodoroTimerStatsResponse copyWith({
    final String? message,
    final bool? status,
    final Data? data,
  }) =>
      GetPomodoroTimerStatsResponse(
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
    this.totalPomodoros,
    this.pomodoros,
  });

  /// Doc Required
  Data.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    totalPomodoros = dataMap['total_pomodoros'] as int?;

    if (dataMap['pomodoros'] != null) {
      pomodoros = <Pomodoros>[];
      for (final dynamic v in (dataMap['pomodoros'] as List<dynamic>)) {
        pomodoros?.add(Pomodoros.fromJson(v));
      }
    }
  }

  /// Doc Required
  num? totalPomodoros;

  /// Doc Required
  List<Pomodoros>? pomodoros;

  /// Doc Required
  Data copyWith({
    final num? totalPomodoros,
    final List<Pomodoros>? pomodoros,
  }) =>
      Data(
        totalPomodoros: totalPomodoros ?? this.totalPomodoros,
        pomodoros: pomodoros ?? this.pomodoros,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['total_pomodoros'] = totalPomodoros;
    if (pomodoros != null) {
      map['pomodoros'] =
          pomodoros?.map((final Pomodoros v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Doc Required
class Pomodoros {
  /// Doc Required
  Pomodoros({
    this.pomodoroId,
    this.pomodoroStatus,
    this.pomodoroDuration,
    this.timers,
  });

  /// Doc Required
  Pomodoros.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    pomodoroId = dataMap['pomodoro_id'] as num?;
    pomodoroStatus = dataMap['pomodoro_status'] as String?;
    pomodoroDuration = dataMap['pomodoro_duration'] as int?;

    if (dataMap['timers'] != null) {
      timers = <Timers>[];
      for (final dynamic v in (dataMap['timers'] as List<dynamic>)) {
        timers?.add(Timers.fromJson(v));
      }
    }
  }

  /// Doc Required
  num? pomodoroId;

  /// Doc Required
  String? pomodoroStatus;

  /// Doc Required
  num? pomodoroDuration;

  /// Doc Required
  List<Timers>? timers;

  /// Doc Required
  Pomodoros copyWith({
    final num? pomodoroId,
    final String? pomodoroStatus,
    final num? pomodoroDuration,
    final List<Timers>? timers,
  }) =>
      Pomodoros(
        pomodoroId: pomodoroId ?? this.pomodoroId,
        pomodoroStatus: pomodoroStatus ?? this.pomodoroStatus,
        pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
        timers: timers ?? this.timers,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['pomodoro_id'] = pomodoroId;
    map['pomodoro_status'] = pomodoroStatus;
    map['pomodoro_duration'] = pomodoroDuration;
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
    this.timerId,
    this.timerStatus,
  });

  /// Doc Required
  Timers.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    timerId = dataMap['timer_id'] as num?;
    timerStatus = dataMap['timer_status'] as String?;
  }

  /// Doc Required
  num? timerId;

  /// Doc Required
  String? timerStatus;

  /// Doc Required
  Timers copyWith({
    final num? timerId,
    final String? timerStatus,
  }) =>
      Timers(
        timerId: timerId ?? this.timerId,
        timerStatus: timerStatus ?? this.timerStatus,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['timer_id'] = timerId;
    map['timer_status'] = timerStatus;
    return map;
  }
}
