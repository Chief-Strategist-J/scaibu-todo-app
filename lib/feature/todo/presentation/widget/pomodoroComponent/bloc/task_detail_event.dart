import 'package:equatable/equatable.dart';

sealed class PomodoroContEvent extends Equatable {}

class InitTaskDetailEvent extends PomodoroContEvent {
  @override
  List<Object?> get props => [];
}

class UpdateTaskDetailEvent extends PomodoroContEvent {
  UpdateTaskDetailEvent({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}
