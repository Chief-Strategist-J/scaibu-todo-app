import 'package:todo_app/controller/todo_api.dart';
import 'package:todo_app/utils/library.dart';

class TodoListViewComponent extends StatelessWidget {
  const TodoListViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoController>(builder: (context, pt, _) {
      return StreamBuilder(
        stream: FirebaseApi().getTodo(),
        builder: (_, data) {
          if (data.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: data.data?.docs.length ?? pt.currentList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final element = data.data?.docs[index].data();
                ToDo toDo = ToDo(
                  taskPriority: element?['taskPriority'] ?? '',
                  taskTitle: element?['taskTitle'] ?? '',
                  taskDescription: element?['taskDescription'] ?? '',
                  selectedDate: element?['selectedDate'] ?? '',
                );

                return TodoListItemComponent(toDo: toDo);
              },
            );
          }
          return Text("No Data Found", style: boldTextStyle()).center();
        },
      );
    });
  }
}
