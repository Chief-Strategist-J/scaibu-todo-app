import 'package:todo_app/core/app_library.dart';

sealed class PomodoroState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PomodoroDataState extends PomodoroState {
  PomodoroDataState();

  factory PomodoroDataState.init() => PomodoroDataState();

  PomodoroDataState copyWith({final Color? color}) => PomodoroDataState();

  @override
  List<Object?> get props => [];
}
