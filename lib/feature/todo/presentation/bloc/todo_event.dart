import 'package:todo_app/core/app_library.dart';

sealed class TodoEvent extends Equatable {}

class LoadingEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class NoInternetConnectionEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class InitTodoEvent extends TodoEvent {
  final List<TodoEntity>? todoList;
  final bool isListUpdated;

  InitTodoEvent({this.todoList, this.isListUpdated = false});

  @override
  List<Object?> get props => [todoList, isListUpdated];

  @override
  bool operator ==(Object other) => identical(this, other) ||
      super == other && other is InitTodoEvent
          && runtimeType == other.runtimeType
          && todoList == other.todoList
          && isListUpdated == other.isListUpdated;

  @override
  int get hashCode => super.hashCode ^ todoList.hashCode;
}
