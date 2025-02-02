import 'package:equatable/equatable.dart';

/// Doc Required
sealed class SettingEvent extends Equatable {}

/// Doc Required
class InitSettingEvent extends SettingEvent {
  /// Doc Required
  @override
  List<Object?> get props => <Object?>[];
}
