import 'package:flutter/cupertino.dart';

///
abstract class TodoChatEvent {}

///
class TodoChatInitEvent extends TodoChatEvent {
  ///
  TodoChatInitEvent(this.context);

  ///
  final BuildContext context;
}
