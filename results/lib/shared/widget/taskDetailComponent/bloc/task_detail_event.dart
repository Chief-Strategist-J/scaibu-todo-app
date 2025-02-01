import 'package:todo_app/core/app_library.dart';

/// A sealed class representing the base for all task detail events.
/// All task-related events extend this class.
sealed class TaskDetailEvent extends Equatable {}

/// Event to initialize task details with the given data.
class InitTaskDetailEvent extends TaskDetailEvent {
  /// Constructor for initializing with [todoPageData].
  InitTaskDetailEvent({required this.todoPageData});

  /// Data for managing the to-do page.
  final ManageTodoPageParam todoPageData;

  @override
  List<Object?> get props => <Object?>[todoPageData];
}

/// Event to update the Pomodoro counter.
class UpdatePomodoroCounterEvent extends TaskDetailEvent {
  /// Constructor for updating with the new [count].
  UpdatePomodoroCounterEvent({required this.count});

  /// The updated Pomodoro count.
  final int count;

  @override
  List<Object?> get props => <Object?>[count];
}

/// Event to update the Pomodoro duration.
class UpdatePomodoroDurationEvent extends TaskDetailEvent {
  /// Constructor for updating with the new [duration].
  UpdatePomodoroDurationEvent({required this.duration});

  /// The updated Pomodoro duration in minutes.
  final int duration;

  @override
  List<Object?> get props => <Object?>[duration];
}

/// Event to update the priority of a task.
class UpdatePriorityEvent extends TaskDetailEvent {
  /// Constructor for updating with the new [priority].
  UpdatePriorityEvent({required this.priority});

  /// The updated priority model for the task.
  final PriorityModel priority;

  @override
  List<Object?> get props => <Object?>[priority];
}

/// Event to mark a tag as selected.
class IsSelectedTagEvent extends TaskDetailEvent {
  /// Constructor for marking the [tag] as selected.
  IsSelectedTagEvent({required this.tag});

  /// The selected tag entity.
  final TagEntity tag;

  @override
  List<Object?> get props => <Object?>[tag];
}

/// Event to mark a project as selected.
class IsSelectedProjectEvent extends TaskDetailEvent {
  /// Constructor for marking the [project] as selected.
  IsSelectedProjectEvent({required this.project});

  /// The selected project entity.
  final ProjectEntity project;

  @override
  List<Object?> get props => <Object?>[project];
}

/// Event to remove a tag from the list.
class RemoveTagFromListEvent extends TaskDetailEvent {
  /// Constructor for removing the [tag] from the list.
  RemoveTagFromListEvent({required this.tag});

  /// The tag entity to be removed.
  final TagEntity tag;

  @override
  List<Object?> get props => <Object?>[tag];
}

/// Event to add a tag to the list.
class AddTagInListEvent extends TaskDetailEvent {
  /// Constructor for adding the [tag] to the list.
  AddTagInListEvent({required this.tag});

  /// The tag entity to be added.
  final TagEntity tag;

  @override
  List<Object?> get props => <Object?>[tag];
}
