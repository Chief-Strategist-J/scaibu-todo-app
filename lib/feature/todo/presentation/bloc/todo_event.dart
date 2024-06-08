import 'package:todo_app/core/todo_library.dart';

sealed class TodoEvent extends Equatable {}

class LoadingEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class InitEvent extends TodoEvent {
  final List<TodoEntity>? todoList;

  InitEvent(this.todoList);

  @override
  List<Object?> get props => [todoList];

  @override
  bool operator ==(Object other) {
    final isInitEvent = other is InitEvent;
    final isRunTypeSame = runtimeType == other.runtimeType;
    final isObjectSame = isInitEvent && isRunTypeSame;

    return identical(this, other) || super == other && isObjectSame && todoList == other.todoList;
  }

  @override
  int get hashCode => super.hashCode ^ todoList.hashCode;
}
