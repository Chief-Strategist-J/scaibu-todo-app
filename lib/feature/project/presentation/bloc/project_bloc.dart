import 'package:todo_app/core/app_library.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final projectCategory = getIt<GetProjectCategoryDataUseCase>(instanceName: ProjectDependencyInjection.getProjectCategoryDataUseCase);

  ProjectBloc() : super(InitProjectState(projectList: const [])) {
    on<InitProjectEvent>(_init);
  }

  @override
  Future<void> close() {
    projectCategory.dispose();
    return super.close();
  }

  void _init(InitProjectEvent event, Emitter<ProjectState> emit) async {
    try {
      final res = await projectCategory(NoParams());

      res.fold(
        (failure) {
          logService.crashLog(errorMessage: 'Failed to fetch project categories: $failure', e: failure);
          emit(InitProjectState(projectList: const [], projectCategoryData: null));
        },
        (projectCategories) {
          emit(InitProjectState(projectList: const [], projectCategoryData: projectCategories));
        },
      );
    } catch (e) {
      logService.crashLog(errorMessage: 'Error during project category fetch operation', e: e);
      emit(InitProjectState(projectList: const [], projectCategoryData: null));
    }
  }
}
