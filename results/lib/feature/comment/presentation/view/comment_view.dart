import 'package:todo_app/core/app_library.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final BuildContext context) =>
            CommentBloc()..add(InitCommentsEvent()),
        child: Builder(builder: _buildPage),
      );

  Widget _buildPage(final BuildContext context) => Container();
}
