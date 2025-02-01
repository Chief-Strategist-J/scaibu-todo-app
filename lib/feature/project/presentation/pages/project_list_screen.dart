import 'package:todo_app/core/app_library.dart';

/// Doc Required

class ProjectListScreen extends HookWidget {
  /// Doc Required

  const ProjectListScreen({super.key});

  void _initProject(
    final BuildContext context,
    final ValueNotifier<List<ProjectItemComponent>> projectComponents,
  ) {
    useEffect(() {
        final ProjectBloc bloc = context.read<ProjectBloc>()
          ..add(InitProjectEvent());

        final StreamSubscription<ProjectState> subscription =
      bloc.stream.listen((final ProjectState state) {
        if (state is InitProjectState) {
            final List<ProjectItemComponent> items = state.projectList
                    ?.map(
                      (final ProjectEntity project) => ProjectItemComponent(
                        title: project.name ?? 'No Title',
                        description: project.description ?? 'No Description',
                        onTap: () {
                          //
                        },
                      ),
                    )
                    .toList() ??
                <ProjectItemComponent>[];
            projectComponents.value = items;
          }
      });

        return subscription.cancel;
      },
      <Object?>[],
    );
  }

  Future<void> _onCreateProjectTap(final BuildContext context) async {
    await context.push(ApplicationPaths.createProjectPage);
  }

  @override
  Widget build(final BuildContext context) {
    // State to hold project components
    final ValueNotifier<List<ProjectItemComponent>> projectComponents =
        useState<List<ProjectItemComponent>>(<ProjectItemComponent>[]);

    // Initialize projects
    _initProject(context, projectComponents);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Projects', style: boldTextStyle(size: 16)),
      ),
      body: projectComponents.value.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.only(
                right: 16,
                bottom: 80,
                left: 16,
              ),
              itemCount: projectComponents.value.length,
              itemBuilder: (final BuildContext context, final int index) =>
                  projectComponents.value[index],
            )
          : Center(
              child: Text('No Projects Found', style: boldTextStyle(size: 16)),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _onCreateProjectTap(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
