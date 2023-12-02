import 'package:todo_app/utils/library.dart';

class TodoListItemComponent extends StatelessWidget {
  final ToDo toDo;
  TodoListItemComponent({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: InformationComponent(toDo: toDo),
    );
  }
}
