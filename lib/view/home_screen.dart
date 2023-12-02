import 'package:todo_app/utils/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TodoController>(context, listen: false).getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do'),
        centerTitle: true,
        actions: [
          Consumer<TodoController>(
            builder: (context, provider, child) {
              return IconButton(
                icon: provider.isList ? Icon(Icons.menu) : Icon(Icons.apps),
                onPressed: () {
                  Provider.of<TodoController>(context, listen: false).setListView();
                },
              );
            },
          ),
          IconButton(
            onPressed: () {
              Provider.of<TodoController>(context, listen: false).setTheme();
            },
            icon: Consumer<TodoController>(
              builder: (context, provider, child) {
                if (provider.isLightTheme) {
                  return Icon(Icons.light_mode_outlined);
                } else {
                  return Icon(Icons.dark_mode_outlined);
                }
              },
            ),
          ),
        ],
      ),
      body: Consumer<TodoController>(
        builder: (context, provider, child) {
          return provider.isList ? TodoListViewComponent() : TodoWrapViewComponent();
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateTodo();
              },
            ),
          );
        },
      ),
    );
  }
}
