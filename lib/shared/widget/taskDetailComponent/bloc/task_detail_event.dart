import 'package:todo_app/core/app_library.dart';

sealed class TaskDetailEvent extends Equatable {}

class InitTaskDetailEvent extends TaskDetailEvent {
  final ManageTodoPageParam todoPageData;

  InitTaskDetailEvent({required this.todoPageData});

  @override
  List<Object?> get props => [todoPageData];
}

class UpdatePomodoroCounterEvent extends TaskDetailEvent {
  UpdatePomodoroCounterEvent({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}

class UpdatePomodoroDurationEvent extends TaskDetailEvent {
  UpdatePomodoroDurationEvent({required this.duration});

  final int duration;

  @override
  List<Object?> get props => [duration];
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

class IsSelectedProjectEvent extends TaskDetailEvent {
  IsSelectedProjectEvent({required this.project});

  final ProjectEntity project;

  @override
  List<Object?> get props => [project];
}

class RemoveTagFromListEvent extends TaskDetailEvent {
  RemoveTagFromListEvent({required this.tag});

  final TagEntity tag;

  @override
  List<Object?> get props => [tag];
}

class AddTagInListEvent extends TaskDetailEvent {
  AddTagInListEvent({required this.tag});

  final TagEntity tag;

  @override
  List<Object?> get props => [tag];
}
