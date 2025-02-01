import 'package:todo_app/core/app_library.dart';

/// Doc Required
sealed class PomodoroState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class PomodoroDataState extends PomodoroState {
  /// Doc Required
  PomodoroDataState();
  /// Doc Required
  factory PomodoroDataState.init() => PomodoroDataState();
  /// Doc Required
  PomodoroDataState copyWith({final Color? color}) => PomodoroDataState();

  @override
  List<Object?> get props => <Object?>[];
}
