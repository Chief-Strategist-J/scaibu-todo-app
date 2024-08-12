import 'package:todo_app/core/app_library.dart';

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

class IsSelectedTagEvent extends TaskDetailEvent {
  IsSelectedTagEvent({required this.tag});

  final TagEntity tag;

  @override
  List<Object?> get props => [tag];
}
