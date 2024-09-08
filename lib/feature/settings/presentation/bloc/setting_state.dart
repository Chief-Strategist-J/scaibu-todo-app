import 'package:todo_app/core/app_library.dart';

sealed class SettingState implements Equatable {
  @override
  List<Object?> get props => [];
}

class InitSettingState implements SettingState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class SettingLoadingState implements SettingState {
  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [];
}

class SettingDataState implements SettingState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
