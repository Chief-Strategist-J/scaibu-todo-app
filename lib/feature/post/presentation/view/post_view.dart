import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/post/presentation/bloc/post_bloc.dart';
import 'package:todo_app/feature/post/presentation/bloc/post_event.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final BuildContext context) =>
            PostBloc()..add(InitPostEvent()),
        child: Builder(builder: _buildPage),
      );

  Widget _buildPage(final BuildContext context) => Container();
}
