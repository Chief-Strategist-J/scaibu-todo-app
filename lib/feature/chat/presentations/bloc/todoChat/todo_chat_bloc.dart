import 'package:pillu_app/core/library/pillu_lib.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_event.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_state.dart';
import 'package:todo_app/main.dart';

///
class TodoChatBloc extends Bloc<TodoChatEvent, TodoChatState> {
  ///
  TodoChatBloc() : super(TodoChatState());

  /// firebase user id
  static String get getFirebaseId =>
      FirebaseAuth.instance.currentUser?.uid ?? '';

  /// get pillu user
  static PilluUserModel get getPilluUser => PilluUserModel(
        imageUrl: getImageUrl,
        firstName: getUserFirstName,
        lastName: getLastName,
        id: getFirebaseId,
      );

  /// last name
  static String get getLastName {
    if ((userCredentials.getLastName ?? '').isNotEmpty ||
        (userCredentials.getFirstName ?? '').isNotEmpty) {
      return userCredentials.getLastName ?? '';
    } else {
      return '';
    }
  }

  /// first name
  static String get getUserFirstName {
    if ((userCredentials.getLastName ?? '').isNotEmpty ||
        (userCredentials.getFirstName ?? '').isNotEmpty) {
      return userCredentials.getFirstName ?? '';
    } else {
      return '';
    }
  }

  /// get user image url
  static String get getImageUrl =>
      FirebaseAuth.instance.currentUser?.providerData.first.photoURL ?? '';
}
