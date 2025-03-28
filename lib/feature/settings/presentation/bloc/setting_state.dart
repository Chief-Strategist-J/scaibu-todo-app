import 'package:todo_app/core/app_library.dart';

/// Doc Required
sealed class SettingState extends Equatable {
  /// Doc Required
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class InitSettingState extends SettingState {
  /// Doc Required
  @override
  List<Object?> get props => <Object?>[];

  /// Doc Required
  @override
  bool? get stringify => false;
}

/// Doc Required
class SettingLoadingState extends SettingState {
  /// Doc Required
  @override
  bool? get stringify => false;

  /// Doc Required
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class SettingDataState extends SettingState {
  /// Doc Required
  @override
  List<Object?> get props => <Object?>[];

  /// Doc Required
  @override
  bool? get stringify => false;
}
