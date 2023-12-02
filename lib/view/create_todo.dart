import 'package:todo_app/controller/todo_api.dart';
import 'package:todo_app/utils/library.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  bool isLow = false;
  bool isMedium = false;
  bool isHigh = false;
  bool isUrgent = false;

  String date = '';
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO-Do", style: primaryTextStyle(size: 18)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Text("Add Todo"),
              Spacer(),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () async {
                  String taskPriority = '';
                  String taskTitle = title.text;
                  String taskDescription = description.text;
                  String selectedDate = date;
                  if (isLow) {
                    taskPriority = 'Low';
                  } else if (isMedium) {
                    taskPriority = 'Medium';
                  } else if (isHigh) {
                    taskPriority = 'High';
                  } else {
                    taskPriority = 'Urgent';
                  }

                  ToDo todo = ToDo(taskPriority: taskPriority, taskTitle: taskTitle, taskDescription: taskDescription, selectedDate: selectedDate);

                  Provider.of<TodoController>(context, listen: false).addToList(todo);
                  Provider.of<TodoController>(context, listen: false).todoSaveList();
                  FirebaseApi api = FirebaseApi();
                  api.addTodo(todo.toJson());

                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 16),
              Icon(Icons.border_all),
              SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  isLow = false;
                  isMedium = false;
                  isHigh = false;
                  isUrgent = false;
                  date = '';
                  title.text = '';
                  description.text = '';
                  setState(() {});
                },
              ),
            ],
          ),
          Center(child: Text("Priority", style: primaryTextStyle(size: 18))),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    isLow = true;
                    isHigh = false;
                    isUrgent = false;
                    isMedium = false;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("Low"),
                    decoration: BoxDecoration(
                      color: isLow ? Colors.yellow : null,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isLow = false;
                    isHigh = false;
                    isUrgent = false;
                    isMedium = true;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("Medium"),
                    decoration: BoxDecoration(
                      color: isMedium ? Colors.yellow : null,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isLow = false;
                    isHigh = true;
                    isUrgent = false;
                    isMedium = false;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("High"),
                    decoration: BoxDecoration(
                      color: isHigh ? Colors.yellow : null,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isLow = false;
                    isHigh = false;
                    isUrgent = true;
                    isMedium = false;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("Urgent"),
                    decoration: BoxDecoration(
                      color: isUrgent ? Colors.yellow : null,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: title,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Title'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: description,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Description'),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text("Pick a Date"),
              SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () async {
                  await showDatePicker(context: context, initialDate: DateTime(2018), firstDate: DateTime(2000), lastDate: DateTime(2100)).then(
                    (value) {
                      date = "${value?.day.toString()}-${value?.day.toString()}-${value?.month.toString()}${value?.year.toString()}" ?? '';
                      setState(() {});
                    },
                  );
                },
              ),
              Spacer(),
              if (date.isNotEmpty) Text(date)
            ],
          ),
        ],
      ),
    );
  }
}
