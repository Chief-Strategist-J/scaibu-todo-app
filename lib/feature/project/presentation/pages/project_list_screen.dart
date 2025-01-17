import 'package:todo_app/core/app_library.dart';

class ProjectListScreen extends HookWidget {
  const ProjectListScreen({super.key});

  void _initProject(BuildContext context, ValueNotifier<List<ProjectItemComponent>> projectComponents) {
    useEffect(() {
      final bloc = context.read<ProjectBloc>();

      bloc.add(InitProjectEvent());

      final subscription = bloc.stream.listen((state) {
        if (state is InitProjectState) {
          final items = state.projectList?.map((project) {
                return ProjectItemComponent(
                  title: project.name ?? 'No Title',
                  description: project.description ?? 'No Description',
                  onTap: () {
                    //
                  },
                );
              }).toList() ??
              [];
          projectComponents.value = items;
        }
      });

      return () => subscription.cancel();
    }, []);
  }

  void _onCreateProjectTap(BuildContext context) {
    context.push(ApplicationPaths.createProjectPage);
  }

  @override
  Widget build(BuildContext context) {
    // State to hold project components
    final projectComponents = useState<List<ProjectItemComponent>>([]);

    // Initialize projects
    _initProject(context, projectComponents);

    return Scaffold(
      appBar: AppBar(title: Text("List Of Projects", style: boldTextStyle(size: 16))),
      body: projectComponents.value.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.only(top: 0, right: 16, bottom: 80, left: 16),
              itemCount: projectComponents.value.length,
              itemBuilder: (context, index) {
                return projectComponents.value[index];
              },
            )
          : Center(child: Text("No Projects Found", style: boldTextStyle(size: 16))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _onCreateProjectTap(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
