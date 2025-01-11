class GetPomodoroTimerStatsResponse {
  GetPomodoroTimerStatsResponse({
    this.message,
    this.status,
    this.data,
  });

  GetPomodoroTimerStatsResponse.fromJson(final dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  Data? data;

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
    this.totalPomodoros,
    this.pomodoros,
  });

  Data.fromJson(final dynamic json) {
    totalPomodoros = json['total_pomodoros'];
    if (json['pomodoros'] != null) {
      pomodoros = <Pomodoros>[];
      json['pomodoros'].forEach((final v) {
        pomodoros?.add(Pomodoros.fromJson(v));
      });
    }
  }

  num? totalPomodoros;
  List<Pomodoros>? pomodoros;

  Data copyWith({
    final num? totalPomodoros,
    final List<Pomodoros>? pomodoros,
  }) =>
      Data(
        totalPomodoros: totalPomodoros ?? this.totalPomodoros,
        pomodoros: pomodoros ?? this.pomodoros,
      );

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

class Pomodoros {
  Pomodoros({
    this.pomodoroId,
    this.pomodoroStatus,
    this.pomodoroDuration,
    this.timers,
  });

  Pomodoros.fromJson(final dynamic json) {
    pomodoroId = json['pomodoro_id'];
    pomodoroStatus = json['pomodoro_status'];
    pomodoroDuration = json['pomodoro_duration'];
    if (json['timers'] != null) {
      timers = <Timers>[];
      json['timers'].forEach((final v) {
        timers?.add(Timers.fromJson(v));
      });
    }
  }

  num? pomodoroId;
  String? pomodoroStatus;
  num? pomodoroDuration;
  List<Timers>? timers;

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

class Timers {
  Timers({
    this.timerId,
    this.timerStatus,
  });

  Timers.fromJson(final dynamic json) {
    timerId = json['timer_id'];
    timerStatus = json['timer_status'];
  }

  num? timerId;
  String? timerStatus;

  Timers copyWith({
    final num? timerId,
    final String? timerStatus,
  }) =>
      Timers(
        timerId: timerId ?? this.timerId,
        timerStatus: timerStatus ?? this.timerStatus,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['timer_id'] = timerId;
    map['timer_status'] = timerStatus;
    return map;
  }
}
