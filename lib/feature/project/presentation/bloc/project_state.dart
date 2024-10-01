import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/domain/entities/projectCategoryDataEntity/project_category_data_entity.dart';

sealed class ProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingProjectState extends ProjectState {}

class NoInternetProjectState extends ProjectState {
  final List<ProjectEntity>? projectList;

  NoInternetProjectState({required this.projectList});

  factory NoInternetProjectState.init() {
    return NoInternetProjectState(projectList: const []);
  }

  NoInternetProjectState copyWith({List<ProjectEntity>? projectList}) {
    return NoInternetProjectState(projectList: projectList ?? this.projectList);
  }

  @override
  List<Object?> get props => [projectList];
}

class InitProjectState extends ProjectState {
  final List<ProjectEntity>? projectList;
  final ProjectCategoryDataModelEntity? projectCategoryData;

  InitProjectState({
    required this.projectList,
    this.projectCategoryData,
  });

  factory InitProjectState.init() {
    return InitProjectState(projectList: const [], projectCategoryData: null);
  }

  InitProjectState copyWith({
    List<ProjectEntity>? projectList,
    ProjectCategoryDataModelEntity? projectCategoryData,
  }) {
    return InitProjectState(
      projectList: projectList ?? this.projectList,
      projectCategoryData: projectCategoryData ?? this.projectCategoryData,
    );
  }

  @override
  List<Object?> get props => [
        projectList,
        projectCategoryData,
      ];
}
