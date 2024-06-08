import 'package:todo_app/core/todo_library.dart';

class EmptyWidget extends StatelessWidget {
  final String msg;

  const EmptyWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(msg));
  }
}
