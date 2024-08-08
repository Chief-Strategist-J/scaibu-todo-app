import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/todoProject/presentation/bloc/todo_project_bloc.dart';
import 'package:todo_app/feature/todoProject/presentation/bloc/todo_project_event.dart';


// TODO: UPDATE THE
class TodoProjectPage extends StatelessWidget {
  const TodoProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoProjectBloc()..add(InitTodoProjectEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Container();
  }
}
