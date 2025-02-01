import 'package:equatable/equatable.dart';

/// Doc Required
sealed class NotificationEvent extends Equatable {
  //
}

/// Doc Required
class InitNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => <Object?>[];
}
