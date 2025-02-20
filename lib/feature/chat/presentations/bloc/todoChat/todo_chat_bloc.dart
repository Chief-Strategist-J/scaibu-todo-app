import 'package:pillu_app/core/library/flutter_chat_types.dart' as types;
import 'package:pillu_app/core/library/pillu_lib.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_event.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_state.dart';

///
class TodoChatBloc extends Bloc<TodoChatEvent, TodoChatState> {
  ///
  TodoChatBloc() : super(TodoChatState()) {
    on<TodoChatInitEvent>(_init);
  }

  Future<void> _init(
    final TodoChatInitEvent event,
    final Emitter<TodoChatState> emit,
  ) async {
    await handleAuthProcess(
      context: event.context,
      bloc: BlocProvider.of<AuthBloc>(event.context),
      authOperation: () async =>
          BlocProvider.of<AuthBloc>(event.context).login(authApi),
      onSuccess: () {
        showToast(event.context, message: 'Done');
      },
      onFailure: () => BlocProvider.of<AuthBloc>(event.context)
          .add(UpdateAuthStateEvent(loggingIn: true)),
    );

    final types.User user = types.User(
      id: FirebaseAuth.instance.currentUser?.uid ?? '',
      firstName: FirebaseAuth.instance.currentUser?.uid ?? '',
      lastName: FirebaseAuth.instance.currentUser?.uid ?? '',
      role: types.Role.user,
      imageUrl:
          FirebaseAuth.instance.currentUser?.providerData.first.photoURL ?? '',
    );

    await FirebaseChatCore.instance.createUserInFirestore(user);
  }
}
