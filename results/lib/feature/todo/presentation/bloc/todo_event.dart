import 'package:todo_app/core/app_library.dart';

/// A sealed class for defining different to-do events,
/// extending Equatable to ensure proper value comparison between instances.
sealed class TodoEvent extends Equatable {}

/// A LoadingEvent class extending TodoEvent, representing a loading state,
/// with an overridden props getter to provide an empty list
/// for equality comparison.
class LoadingEvent extends TodoEvent {
  @override
  List<Object?> get props => <Object?>[];
}

/// A NoInternetConnectionEvent class extending TodoEvent, representing an event
/// triggered when there is no internet connection, with an overridden props
/// getter returning an empty list for equality comparison.
class NoInternetConnectionEvent extends TodoEvent {
  @override
  List<Object?> get props => <Object?>[];
}

/// Represents an event that initializes the To-do list,
/// extending from `TodoEvent`.
class InitTodoEvent extends TodoEvent {
  /// Constructor for the `InitTodoEvent` class, which optionally
  /// takes a list of To-do entities
  /// and a boolean flag to specify if the list has been updated.
  InitTodoEvent({this.todoList, this.isListUpdated = false});

  ///Optional list of To-do entities.
  final List<TodoEntity>? todoList;

  /// Boolean flag to indicate if the list has been updated.
  final bool isListUpdated;

  @override
  List<Object?> get props => <Object?>[todoList, isListUpdated];

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      super == other &&
          other is InitTodoEvent &&
          runtimeType == other.runtimeType &&
          todoList == other.todoList &&
          isListUpdated == other.isListUpdated;

  @override
  int get hashCode => super.hashCode ^ todoList.hashCode;
}
