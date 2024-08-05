import 'package:equatable/equatable.dart';

sealed class PomodoroContEvent extends Equatable {}

class InitPomodoroEvent extends PomodoroContEvent {
  @override
  List<Object?> get props => [];
}

class UpdatePomodoroEvent extends PomodoroContEvent {
  UpdatePomodoroEvent({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}
