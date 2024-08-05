import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/todo/presentation/widget/taskDetailComponent/model/priority_model.dart';

sealed class TaskDetailState extends Equatable {}

class TaskDetailInitState extends TaskDetailState {
  @override
  List<Object?> get props => [];
}

class TaskDetailDataState extends TaskDetailState {
  final int? _pomodoroCont;
  final PriorityModel? _priority;

  @override
  List<Object?> get props {
    return [
      _pomodoroCont,
      _priority,
    ];
  }

  TaskDetailDataState({
    int? pomodoroCont,
    PriorityModel? priority,
  })  : _priority = priority,
        _pomodoroCont = pomodoroCont;

  PriorityModel? get priority => _priority;

  int? get pomodoroCont => _pomodoroCont;

  TaskDetailDataState copyWith({int? pomodoroCont, PriorityModel? priority}) {
    return TaskDetailDataState(
      pomodoroCont: pomodoroCont ?? this.pomodoroCont,
      priority: priority ?? this.priority,
    );
  }
}
