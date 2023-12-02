import 'package:todo_app/controller/todo_api.dart';
import 'package:todo_app/utils/library.dart';

class TodoWrapViewComponent extends StatelessWidget {
  const TodoWrapViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoController>(
      builder: (context, pt, _) {
        return StreamBuilder(
          stream: FirebaseApi().getTodo(),
          builder: (context, data) {
            if (data.hasData) {
              return ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: data.data?.docs.validate().map((element) {
                          ToDo toDo = ToDo(
                            taskPriority: element['taskPriority'] ?? '',
                            taskTitle: element['taskTitle'] ?? '',
                            taskDescription: element['taskDescription'] ?? '',
                            selectedDate: element['selectedDate'] ?? '',
                          );

                          return Container(
                            height: MediaQuery.of(context).size.height * 0.21,
                            width: MediaQuery.of(context).size.width * 0.45,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(16)),
                            child: InformationComponent(toDo: toDo),
                          );
                        }).toList() ??
                        [],
                  )
                ],
              );
            } else {
              return Text("No data Found", style: boldTextStyle()).center();
            }
          },
        );
      },
    );
  }
}
