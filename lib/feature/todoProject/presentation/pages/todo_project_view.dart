import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/todoProject/presentation/bloc/todo_project_bloc.dart';
import 'package:todo_app/feature/todoProject/presentation/bloc/todo_project_event.dart';



class TodoProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoProjectBloc()..add(InitTodoProjectEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TodoProjectBloc>(context);

    return Container();
  }
}

