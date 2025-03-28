import 'package:equatable/equatable.dart';

/// Doc Required
sealed class PomodoroEvent extends Equatable {}

/// Doc Required
class InitPomodoroEvent extends PomodoroEvent {
  @override
  List<Object?> get props => <Object?>[];
}
