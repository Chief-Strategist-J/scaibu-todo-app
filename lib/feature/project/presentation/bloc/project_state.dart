import 'package:todo_app/core/app_library.dart';

/// Doc Required

sealed class ProjectState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required

class LoadingProjectState extends ProjectState {}

/// Doc Required

class NoInternetProjectState extends ProjectState {
  /// Doc Required

  NoInternetProjectState({required this.projectList});

  /// Doc Required

  factory NoInternetProjectState.init() =>
      NoInternetProjectState(projectList: const <ProjectEntity>[]);

  /// Doc Required

  final List<ProjectEntity>? projectList;

  /// Doc Required

  NoInternetProjectState copyWith({final List<ProjectEntity>? projectList}) =>
      NoInternetProjectState(projectList: projectList ?? this.projectList);

  @override
  List<Object?> get props => <Object?>[projectList];
}

/// Doc Required

class InitProjectState extends ProjectState {
  /// Doc Required
  InitProjectState({
    required this.projectList,
    required final DateTime updatedAt,
    this.projectCategoryData,
  }) : _updatedAt = updatedAt;

  // Ensure updatedAt is always initialized
  // Factory constructor for initial state
  /// Doc Required
  factory InitProjectState.init() => InitProjectState(
        projectList: const <ProjectEntity>[],
        updatedAt: DateTime.now(),
      );

  /// Doc Required
  final List<ProjectEntity>? projectList;

  /// Doc Required

  final ProjectCategoryDataModelEntity? projectCategoryData;
  final DateTime _updatedAt;

  /// Doc Required
  InitProjectState copyWith({
    final List<ProjectEntity>? projectList,
    final ProjectCategoryDataModelEntity? projectCategoryData,
    final DateTime? updatedAt, // Optional updatedAt
  }) =>
      InitProjectState(
        projectList: projectList ?? this.projectList,
        projectCategoryData: projectCategoryData ?? this.projectCategoryData,
        updatedAt: updatedAt ?? DateTime.now(), // Default to now if null
      );

  @override
  List<Object?> get props => <Object?>[
        projectList,
        projectCategoryData,
        _updatedAt, // Ensure updatedAt is part of state comparison
      ];
}
