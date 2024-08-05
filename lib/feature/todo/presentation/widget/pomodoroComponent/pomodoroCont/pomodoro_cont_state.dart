import 'package:equatable/equatable.dart';

sealed class PomodoroContState extends Equatable {}

class PomodoroInitState extends PomodoroContState {
  @override
  List<Object?> get props => [];
}

class PomodoroDataState extends PomodoroContState {
  final int? _pomodoroCont;

  @override
  List<Object?> get props => [_pomodoroCont];

  PomodoroDataState({
    int? pomodoroCont,
  }) : _pomodoroCont = pomodoroCont;

  int? get pomodoroCont => _pomodoroCont;

  PomodoroDataState copyWith({int? pomodoroCont}) {
    return PomodoroDataState(
      pomodoroCont: pomodoroCont ?? this.pomodoroCont,
    );
  }
}
