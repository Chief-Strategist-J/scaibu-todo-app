import 'package:equatable/equatable.dart';

sealed class SettingEvent extends Equatable{}

class InitSettingEvent extends SettingEvent {
  @override
  List<Object?> get props => [];
}