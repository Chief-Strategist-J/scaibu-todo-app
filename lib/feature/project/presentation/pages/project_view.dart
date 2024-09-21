// TODO: UPDATE THE
import 'package:todo_app/core/app_library.dart';

class TodoProjectPage extends StatelessWidget {
  const TodoProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProjectBloc()..add(InitProjectEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Container();
  }
}
