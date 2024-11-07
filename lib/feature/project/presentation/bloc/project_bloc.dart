import 'package:todo_app/core/app_library.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final projectCategory = getIt<GetProjectCategoryDataUseCase>(instanceName: ProjectDependencyInjection.getProjectCategoryDataUseCase);

  ProjectBloc() : super(InitProjectState(projectList: const [], updatedAt: DateTime.now())) {
    on<InitProjectEvent>(_init);
    on<CreateProjectEvent>(_createProject);
  }

  void _init(InitProjectEvent event, Emitter<ProjectState> emit) async {
    try {
      final res = await projectCategory(NoParams());

      res.fold(
        (failure) {
          logService.crashLog(errorMessage: 'Failed to fetch project categories: $failure', e: failure);
          emit(InitProjectState.init());
        },
        (projectCategories) {
          emit(InitProjectState(
            projectList: const [], // Ensure a fresh list reference
            projectCategoryData: projectCategories,
            updatedAt: DateTime.now(),
          ));
        },
      );
    } catch (e) {
      logService.crashLog(errorMessage: 'Error during project category fetch operation', e: e);
      emit(InitProjectState.init()); // Return initial state on error
    }
  }

  Future<void> _createProject(CreateProjectEvent event, Emitter<ProjectState> emit) async {
    final createProject = getIt<CreateProjectUseCase>(instanceName: ProjectDependencyInjection.createProjectUseCase);
    await createProject(event.request);
  }
}
