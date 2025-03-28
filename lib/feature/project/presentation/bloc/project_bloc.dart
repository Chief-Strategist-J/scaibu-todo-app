import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  /// Doc Required

  ProjectBloc()
      : super(
          InitProjectState(
            projectList: const <ProjectEntity>[],
            updatedAt: DateTime.now(),
          ),
        ) {
    on<InitProjectEvent>(_init);
    on<CreateProjectEvent>(_createProject);
    on<DeleteProjectEvent>(_deleteProject);
  }

  /// Doc Required

  final GetProjectCategoryDataUseCase _projectCategory =
      getIt<GetProjectCategoryDataUseCase>(
    instanceName: ProjectDependencyInjection.getProjectCategoryDataUseCase,
  );

  /// Doc Required

  final GetAllProjectsUseCase _listOfProjectsUseCase =
      getIt<GetAllProjectsUseCase>(
    instanceName: ProjectDependencyInjection.getAllProjectsUseCase,
  );

  Future<void> _init(
    final InitProjectEvent event,
    final Emitter<ProjectState> emit,
  ) async {
    try {
      await _projectCategory.updateData();

      final Either<Failure, ProjectCategoryDataModelEntity> res =
          await _projectCategory(NoParams());

      await _listOfProjectsUseCase.updateData();

      final Either<Failure, List<ProjectEntity>> projectListRes =
          await _listOfProjectsUseCase(NoParams());

      res.fold(
        (final Failure failure) {
          logService.crashLog(
            errorMessage: 'Failed to fetch project categories: $failure',
            e: failure,
          );
          emit(InitProjectState.init());
        },
        (final ProjectCategoryDataModelEntity projectCategories) {
          projectListRes.fold(
            (final Failure failure) {
              logService.crashLog(
                errorMessage: 'Failed to fetch project list: $failure',
                e: failure,
              );
              emit(
                InitProjectState(
                  projectList: const <ProjectEntity>[],
                  projectCategoryData: projectCategories,
                  updatedAt: DateTime.now(),
                ),
              );
            },
            (final List<ProjectEntity> allProjectList) {
              emit(
                InitProjectState(
                  projectList: allProjectList,
                  projectCategoryData: projectCategories,
                  updatedAt: DateTime.now(),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      await logService.crashLog(
        errorMessage: 'Error during project category fetch operation',
        e: e,
      );
      emit(InitProjectState.init()); // Return initial state on error
    }
  }

  Future<void> _createProject(
    final CreateProjectEvent event,
    final Emitter<ProjectState> emit,
  ) async {
    final CreateProjectUseCase createProject = getIt<CreateProjectUseCase>(
      instanceName: ProjectDependencyInjection.createProjectUseCase,
    );
    final ProjectPageParam param = event.request;

    await createProject(
      <String, dynamic>{
        'name': param.projectName.text,
        'description': param.projectDescription.text,
        'status': param.projectStatus.text,
        'end_date': param.endDate?.dateTime.toIso8601String(),
        'is_public': param.isPublic,
        'created_by': userCredentials.getUserId,
        'updated_by': userCredentials.getUserId,
        'project_category_name': param.projectCategory.text,
        'project_phase_name': param.projectPhase.text,
        'project_status_name': param.projectStatus.text,
        'project_priority_name': param.projectPriority.text,
        'project_type_name': param.projectProjectType.text,
      },
    );
  }

  Future<void> _deleteProject(
    final DeleteProjectEvent event,
    final Emitter<ProjectState> emit,
  ) async {
    final DeleteProjectUseCase deleteProjectUseCase =
        getIt<DeleteProjectUseCase>(
      instanceName: ProjectDependencyInjection.deleteProjectUseCase,
    );

    await deleteProjectUseCase(event.projectId);
    add(InitProjectEvent());
  }
}
