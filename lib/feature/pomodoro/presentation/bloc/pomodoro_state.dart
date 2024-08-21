import 'package:todo_app/core/app_library.dart';

sealed class PomodoroState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PomodoroDataState extends PomodoroState {
  PomodoroDataState();

  factory PomodoroDataState.init() {
    return PomodoroDataState();
  }

  PomodoroDataState copyWith({Color? color}) {
    return PomodoroDataState();
  }

  @override
  List<Object?> get props => [];
}
