import 'package:equatable/equatable.dart';

sealed class NotificationEvent extends Equatable {
  //
}

class InitNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}
