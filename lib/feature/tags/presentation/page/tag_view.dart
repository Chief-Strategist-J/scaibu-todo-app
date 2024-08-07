import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/tags/presentation/bloc%20/tag_bloc.dart';
import 'package:todo_app/feature/tags/presentation/bloc%20/tag_event.dart';


class TagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TagBloc()..add(InitTagEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TagBloc>(context);

    return Container();
  }
}

