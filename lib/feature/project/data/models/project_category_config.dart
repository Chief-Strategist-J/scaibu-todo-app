import 'package:todo_app/core/app_library.dart';

class ProjectCategoryConfig<T> {
  final String title;
  final List<T> items;
  final TextEditingController controller;
  final FocusNode focusNode;

  ProjectCategoryConfig({
    required this.title,
    required this.items,
    required this.controller,
    required this.focusNode,
  });

  List<ProjectCategoryConfig> getList(ProjectPageParam projectParam) {
    return [
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
  }

  String getCategoryName(dynamic T) {
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
