import 'package:pillu_app/config/bloc_config.dart';
import 'package:pillu_app/core/library/pillu_lib.dart';
import 'package:pillu_app/shared/widgets/connect_user_component.dart';
import 'package:todo_app/feature/chat/presentations/bloc/todoChat/todo_chat_bloc.dart';

/// Chat page
class TodoChatPage extends StatelessWidget {
  /// Chat page

  TodoChatPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(final BuildContext context) => CustomBlocBuilder<PilluAuthBloc>(
        create: (final BuildContext context) =>
            PilluAuthBloc(PilluAuthRepository()),
        builder: (final BuildContext context, final PilluAuthBloc bloc) =>
            BlocProvider<TodoChatBloc>(
          create: (final BuildContext context) => TodoChatBloc(),
          child: Builder(builder: _buildPage),
        ),
      );

  Widget _buildPage(final BuildContext context) {
    context.read<PilluAuthBloc>().add(AuthAuthenticated());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
          const ThemeWrapper(child: ConnectUserComponent()),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _openEndDrawer,
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: ThemeWrapper(
          child: Text(
            'Chat Connect',
            style: buildJostTextStyle(fontSize: 14),
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: const AppDrawerData(),
      body: const CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: AppBody(),
          ),
        ],
      ),
    );
  }


}
