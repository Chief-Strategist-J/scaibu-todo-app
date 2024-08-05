import 'package:equatable/equatable.dart';

sealed class TaskDetailState extends Equatable {}

class TaskDetailInitState extends TaskDetailState {
  @override
  List<Object?> get props => [];
}

class TaskDetailDataState extends TaskDetailState {
  final int? _pomodoroCont;

  @override
  List<Object?> get props => [_pomodoroCont];

  TaskDetailDataState({
    int? pomodoroCont,
  }) : _pomodoroCont = pomodoroCont;

  int? get pomodoroCont => _pomodoroCont;

  TaskDetailDataState copyWith({int? pomodoroCont}) {
    return TaskDetailDataState(
      pomodoroCont: pomodoroCont ?? this.pomodoroCont,
    );
  }
}
