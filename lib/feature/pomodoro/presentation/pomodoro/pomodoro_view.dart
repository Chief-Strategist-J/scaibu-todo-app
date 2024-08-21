import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
import 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_event.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PomodoroBloc()..add(InitPomodoroEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<PomodoroBloc>(context);

    return Container();
  }
}
