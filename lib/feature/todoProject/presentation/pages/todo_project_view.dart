import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_project_bloc.dart';
import 'todo_project_event.dart';
import 'todo_project_state.dart';

class TodoProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoProjectBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TodoProjectBloc>(context);

    return Container();
  }
}

