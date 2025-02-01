import 'package:todo_app/core/app_library.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final projectCategory = getIt<GetProjectCategoryDataUseCase>(instanceName: ProjectDependencyInjection.getProjectCategoryDataUseCase);
  final listOfProjectsUseCase = getIt<GetAllProjectsUseCase>(instanceName: ProjectDependencyInjection.getAllProjectsUseCase);

  ProjectBloc() : super(InitProjectState(projectList: const [], updatedAt: DateTime.now())) {
    on<InitProjectEvent>(_init);
    on<CreateProjectEvent>(_createProject);
  }

  void _init(InitProjectEvent event, Emitter<ProjectState> emit) async {
    try {
      final res = await projectCategory(NoParams());
      final projectListRes = await listOfProjectsUseCase(NoParams());

      res.fold(
        (failure) {
          logService.crashLog(errorMessage: 'Failed to fetch project categories: $failure', e: failure);
          emit(InitProjectState.init());
        },
        (projectCategories) {
          projectListRes.fold(
            (failure) {
              logService.crashLog(errorMessage: 'Failed to fetch project list: $failure', e: failure);
              emit(InitProjectState(projectList: const [], projectCategoryData: projectCategories, updatedAt: DateTime.now()));
            },
            (allProjectList) {
              emit(InitProjectState(projectList: allProjectList, projectCategoryData: projectCategories, updatedAt: DateTime.now()));
            },
          );
        },
      );
    } catch (e) {
      logService.crashLog(errorMessage: 'Error during project category fetch operation', e: e);
      emit(InitProjectState.init()); // Return initial state on error
    }
  }

  Future<void> _createProject(CreateProjectEvent event, Emitter<ProjectState> emit) async {
    final createProject = getIt<CreateProjectUseCase>(instanceName: ProjectDependencyInjection.createProjectUseCase);
    final _param = event.request;

    await createProject(
      {
        "name": _param.projectName.text,
        "description": _param.projectDescription.text,
        "status": _param.projectStatus.text,
        "end_date": _param.endDate?.dateTime.toIso8601String(),
        "is_public": _param.isPublic,
        "created_by": userCredentials.getUserId,
        "updated_by": userCredentials.getUserId,
        "project_category_name": _param.projectCategory.text,
        "project_phase_name": _param.projectPhase.text,
        "project_status_name": _param.projectStatus.text,
        "project_priority_name": _param.projectPriority.text,
        "project_type_name": _param.projectProjectType.text,
      },
    );
  }

  void getListOfProjects() {
    //
  }
}
