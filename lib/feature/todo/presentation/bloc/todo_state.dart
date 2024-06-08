import 'package:todo_app/core/todo_library.dart';

sealed class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TodoState {}

class InitTodoState extends TodoState {
  final List<TodoEntity>? todoList;

  InitTodoState({required this.todoList});

  factory InitTodoState.init() {
    return InitTodoState(todoList: []);
  }

  InitTodoState copyWith({List<TodoEntity>? todoList}) {
    return InitTodoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
