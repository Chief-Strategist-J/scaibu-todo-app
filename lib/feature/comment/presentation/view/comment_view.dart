import 'package:todo_app/core/app_library.dart';

/// Doc Required
class CommentPage extends StatelessWidget {
  /// Doc Required
  const CommentPage({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<CommentBloc>(
        create: (final BuildContext context) =>
            CommentBloc()..add(InitCommentsEvent()),
        child: Builder(builder: _buildPage),
      );

  Widget _buildPage(final BuildContext context) => Container();
}
