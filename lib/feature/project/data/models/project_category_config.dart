import 'dart:core';

import 'package:todo_app/core/app_library.dart';

/// Doc Required

abstract class BaseProjectCategoryConfig {
  /// Doc Required

  String get title;

  /// Doc Required

  TextEditingController get controller;

  /// Doc Required

  FocusNode get focusNode;

  /// Doc Required
  List<dynamic> get items;
}

/// Doc Required
class ProjectCategoryConfig<T> implements BaseProjectCategoryConfig {
  /// Doc Required
  ProjectCategoryConfig({
    required this.title,
    required this.items,
    required this.controller,
    required this.focusNode,
  });

  /// Doc Required
  @override
  final String title;

  /// Doc Required
  @override
  final List<T> items;

  /// Doc Required
  @override
  final TextEditingController controller;

  /// Doc Required
  @override
  final FocusNode focusNode;

  /// Doc Required
  static List<BaseProjectCategoryConfig> getList(
    final ProjectPageParam projectParam,
  ) =>
      <BaseProjectCategoryConfig>[
        ProjectCategoryConfig<ProjectCategoryEntity>(
          title: 'Project Categories',
          items: projectParam.listOfProjectCategories,
          controller: projectParam.projectCategory,
          focusNode: projectParam.projectCategoryNode,
        ),
        ProjectCategoryConfig<ProjectStatusEntity>(
          title: 'Project Status',
          items: projectParam.listOfProjectStatuses,
          controller: projectParam.projectStatus,
          focusNode: projectParam.projectStatusNode,
        ),
        ProjectCategoryConfig<ProjectPriorityEntity>(
          title: 'Project Priority',
        items: projectParam.listOfProjectPriority,
        controller: projectParam.projectPriority,
        focusNode: projectParam.projectPriorityNode,
      ),
      ProjectCategoryConfig<ProjectPhaseEntity>(
        title: 'Project Phases',
        items: projectParam.listOfProjectPhases,
        controller: projectParam.projectPhase,
        focusNode: projectParam.projectPhaseNode,
      ),
      ProjectCategoryConfig<ProjectTypeEntity>(
        title: 'Project Type',
        items: projectParam.listOfProjectTypes,
        controller: projectParam.projectProjectType,
        focusNode: projectParam.projectProjectTypeNode,
      ),
    ];

  /// Doc Required
  String getCategoryName(final dynamic T) {
    if (T is ProjectCategoryEntity) {
      return T.name.validate();
    } else if (T is ProjectPhaseEntity) {
      return T.name.validate();
    } else if (T is ProjectStatusEntity) {
      return T.name.validate();
    } else if (T is ProjectTypeEntity) {
      return T.name.validate();
    } else if (T is ProjectPriorityEntity) {
      return T.name.validate();
    } else {
      return '';
    }
  }
}
