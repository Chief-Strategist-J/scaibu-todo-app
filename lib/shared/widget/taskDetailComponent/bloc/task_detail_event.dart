import 'package:equatable/equatable.dart';
import 'package:todo_app/shared/widget/taskDetailComponent/model/priority_model.dart';

sealed class TaskDetailEvent extends Equatable {}

class InitTaskDetailEvent extends TaskDetailEvent {
  @override
  List<Object?> get props => [];
}

class UpdatePomodoroCounterEvent extends TaskDetailEvent {
  UpdatePomodoroCounterEvent({required this.count});
  final int count;

  @override
  List<Object?> get props => [count];
}

class UpdatePriorityEvent extends TaskDetailEvent {
  UpdatePriorityEvent({required this.priority});
  final PriorityModel priority;

  @override
  List<Object?> get props => [priority];
}
