import 'package:equatable/equatable.dart';

sealed class TaskDetailEvent extends Equatable {}

class InitTaskDetailEvent extends TaskDetailEvent {
  @override
  List<Object?> get props => [];
}

class UpdateTaskDetailEvent extends TaskDetailEvent {
  UpdateTaskDetailEvent({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}
