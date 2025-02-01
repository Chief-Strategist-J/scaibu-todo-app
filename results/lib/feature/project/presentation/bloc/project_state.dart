import 'package:todo_app/core/app_library.dart';

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
  final DateTime _updatedAt;

  InitProjectState({
    required this.projectList,
    this.projectCategoryData,
    required DateTime updatedAt,
  }) : _updatedAt = updatedAt; // Ensure updatedAt is always initialized

  // Factory constructor for initial state
  factory InitProjectState.init() {
    return InitProjectState(
      projectList: const [],
      projectCategoryData: null,
      updatedAt: DateTime.now(),
    );
  }

  InitProjectState copyWith({
    List<ProjectEntity>? projectList,
    ProjectCategoryDataModelEntity? projectCategoryData,
    DateTime? updatedAt, // Optional updatedAt
  }) {
    return InitProjectState(
      projectList: projectList ?? this.projectList,
      projectCategoryData: projectCategoryData ?? this.projectCategoryData,
      updatedAt: updatedAt ?? DateTime.now(), // Default to now if null
    );
  }

  @override
  List<Object?> get props => [
        projectList,
        projectCategoryData,
        _updatedAt, // Ensure updatedAt is part of state comparison
      ];
}
