import 'package:todo_app/core/app_library.dart';

/// A sealed class representing the general state for the To-do application.
sealed class TodoState extends Equatable {
  /// Provides a list of properties that define the state for comparison
  /// (used for equality checking).
  @override
  List<Object?> get props => <Object?>[];
}

/// State representing a loading status (e.g., when data is being fetched).
class LoadingState extends TodoState {}

/// State representing no internet connection.
class NoInternetState extends TodoState {
  /// Constructor for NoInternetState, which accepts a To-do list.
  NoInternetState({required this.todoList});

  /// Factory constructor for initializing the
  /// NoInternetState with an empty Tod-o list.
  factory NoInternetState.init() =>
      NoInternetState(todoList: const <TodoEntity>[]);

  /// A list of To-do entities (optional).
  final List<TodoEntity>? todoList;

  /// Method to copy the current state and possibly update the To-do list.
  InitTodoState copyWith({final List<TodoEntity>? todoList}) =>
      InitTodoState(todoList: todoList ?? this.todoList);

  /// Overrides the Equatable `props`
  /// to include `todoList` for equality checking.
  @override
  List<Object?> get props => <Object?>[todoList];
}

/// State representing the initialized To-do list.
class InitTodoState extends TodoState {
  /// Constructor for initializing with a To-do list.
  InitTodoState({required this.todoList});

  /// Factory constructor for initializing with an empty To-do list.
  factory InitTodoState.init() => InitTodoState(todoList: const <TodoEntity>[]);

  /// A list of To-do entities (optional).
  final List<TodoEntity>? todoList;

  /// Method to copy the current state and possibly update the To-do list.
  InitTodoState copyWith({final List<TodoEntity>? todoList}) =>
      InitTodoState(todoList: todoList ?? this.todoList);

  /// Overrides the Equatable `props` to include `todoList`
  /// for equality checking.
  @override
  List<Object?> get props => <Object?>[todoList];
}
