import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/settings/presentation/bloc/setting_bloc.dart';
import 'package:todo_app/feature/settings/presentation/bloc/setting_event.dart';

/// Doc Required
class SettingPage extends StatelessWidget {
  /// Doc Required
  const SettingPage({super.key});

  /// Doc Required
  @override
  Widget build(final BuildContext context) => BlocProvider<SettingBloc>(
        create: (final BuildContext context) =>
            SettingBloc()..add(InitSettingEvent()),
        child: Builder(
          builder: _buildPage,
        ),
      );

  Widget _buildPage(final BuildContext context) => Container();
}
