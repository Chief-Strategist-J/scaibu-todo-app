import 'package:equatable/equatable.dart';

sealed class PomodoroEvent  extends Equatable {}

class InitPomodoroEvent extends PomodoroEvent {
  @override

  List<Object?> get props => [];
}
