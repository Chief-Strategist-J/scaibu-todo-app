import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';

sealed class TodoEvent extends Equatable {}

class InitEvent extends TodoEvent {
  final List<TodoEntity>? todoList;

  InitEvent(this.todoList);

  @override
  List<Object?> get props => [todoList];

  @override
  bool operator ==(Object other) {
    return identical(this, other) || super == other && other is InitEvent && runtimeType == other.runtimeType && todoList == other.todoList;
  }

  @override
  int get hashCode => super.hashCode ^ todoList.hashCode;
}
