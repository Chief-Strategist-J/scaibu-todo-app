

import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/comment/presentation/bloc/comment_bloc.dart';
import 'package:todo_app/feature/comment/presentation/bloc/comment_event.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CommentBloc()..add(InitCommentsEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<CommentBloc>(context);

    return Container();
  }
}

