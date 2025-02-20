import 'package:pillu_app/config/bloc_config.dart';
import 'package:pillu_app/core/library/pillu_lib.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_bloc.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_event.dart';

/// Chat page
class TodoChatPage extends StatelessWidget {
  /// Chat page
  const TodoChatPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomBlocBuilder<AuthBloc>(
        create: (final BuildContext context) => AuthBloc(AuthRepository()),
        init: (final AuthBloc bloc) {
          bloc.add(InitAuthEvent());
        },
        builder: (final BuildContext context, final AuthBloc bloc) =>
            BlocProvider<TodoChatBloc>(
          create: (final BuildContext context) => TodoChatBloc(),
          child: Builder(builder: _buildPage),
        ),
      );

  Widget _buildPage(final BuildContext context) {
    context.read<TodoChatBloc>().add(TodoChatInitEvent(context));
    return Scaffold(
      appBar: buildAppBar(context),
      endDrawer: const AppDrawerData(),
      body: const AppBody(),
    );
  }
}
