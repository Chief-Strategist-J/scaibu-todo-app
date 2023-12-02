import 'package:todo_app/utils/library.dart';

class TodoController extends ChangeNotifier {
  List<ToDo> currentList = [];
  bool isLightTheme = false;
  bool isList = false;

  void setTheme() {
    isLightTheme = !isLightTheme;
    print('isLightTheme - $isLightTheme');
    notifyListeners();
  }

  void setListView() {
    isList = !isList;
    print('isList - $isList');
    notifyListeners();
  }

  void addToList(todo) {
    currentList.add(todo);
    notifyListeners();
  }

  void todoSaveList() {
    final box = GetStorage();

    List<Map> currList = [];
    currentList.forEach((element) {
      currList.add(element.toJson());
    });

    box.write("Data", currList);
  }

  void getTodoList() {
    final box = GetStorage();

    List<Map> currList = [];
    currentList.forEach((element) {
      currList.add(element.toJson());
    });

    if (box.read("Data") != null) {
      var list = box.read("Data");

      currentList.clear();
      list.forEach((element) {
        currentList.add(
          ToDo(
            taskPriority: element['taskPriority'],
            taskTitle: element['taskTitle'],
            taskDescription: element['taskDescription'],
            selectedDate: element['selectedDate'],
          ),
        );
      });
    }
  }
}
