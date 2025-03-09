import 'package:pillu_app/core/library/pillu_lib.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_event.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_state.dart';
import 'package:todo_app/main.dart';

///
class TodoChatBloc extends Bloc<TodoChatEvent, TodoChatState> {
  ///
  TodoChatBloc() : super(TodoChatState());
}
