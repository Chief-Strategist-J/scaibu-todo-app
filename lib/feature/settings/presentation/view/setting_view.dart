import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/settings/presentation/bloc/setting_bloc.dart';
import 'package:todo_app/feature/settings/presentation/bloc/setting_event.dart';



class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingBloc()..add(InitSettingEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SettingBloc>(context);

    return Container();
  }
}

