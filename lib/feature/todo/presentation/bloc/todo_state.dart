import 'package:todo_app/core/app_library.dart';

sealed class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TodoState {}

class NoInternetState extends TodoState {
  final List<TodoEntity>? todoList;

  NoInternetState({required this.todoList});

  factory NoInternetState.init() {
    return NoInternetState(todoList: const []);
  }

  InitTodoState copyWith({List<TodoEntity>? todoList}) {
    return InitTodoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}

class InitTodoState extends TodoState {
  final List<TodoEntity>? todoList;

  InitTodoState({required this.todoList});

  factory InitTodoState.init() {
    return InitTodoState(todoList: const []);
  }

  InitTodoState copyWith({List<TodoEntity>? todoList}) {
    return InitTodoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
