import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tag_bloc.dart';
import 'tag_event.dart';
import 'tag_state.dart';

class TagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TagBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TagBloc>(context);

    return Container();
  }
}

