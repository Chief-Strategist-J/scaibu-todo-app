import 'package:todo_app/core/app_library.dart';



class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(InitProjectState(projectList: const [])) {
    on<InitProjectEvent>(_init);
  }

  void _init(InitProjectEvent event, Emitter<ProjectState> emit) async {
    try {
      final res = await getIt<GetProjectCategoryDataUseCase>(instanceName: ProjectDependencyInjection.getProjectCategoryDataUseCase)(NoParams());

      res.fold((failure) {
        logService.crashLog(errorMessage: 'Failed to fetch project categories', e: Object());
        emit(InitProjectState(projectList: const [], projectCategoryData: null));
      }, (projectCategories) {
        emit(InitProjectState(projectList: const [], projectCategoryData: projectCategories));
      });
    } catch (e) {
      logService.crashLog(errorMessage: 'Unexpected error occurred while fetching project categories', e: e);
      emit(InitProjectState(projectList: const [], projectCategoryData: null));
    }
  }
}
