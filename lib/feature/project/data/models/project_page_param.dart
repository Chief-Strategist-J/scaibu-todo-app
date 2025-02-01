import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectPageParam {
  /// Doc Required
  TextEditingController projectName = TextEditingController();

  /// Doc Required
  TextEditingController projectDescription = TextEditingController();

  /// Doc Required
  TextEditingController projectStartDate = TextEditingController(); // date type
  /// Doc Required
  TimeServiceModel? startDate;

  /// Doc Required
  TextEditingController projectEndDate = TextEditingController(); // date type
  /// Doc Required
  TimeServiceModel? endDate;

  /// Doc Required
  TextEditingController projectBudget =
      TextEditingController(); // list type and int type
  /// Doc Required
  List<ProjectCategoryEntity> listOfProjectCategories =
      <ProjectCategoryEntity>[];

  /// Doc Required
  TextEditingController projectCategory = TextEditingController(); // list type
  /// Doc Required
  List<ProjectPriorityEntity> listOfProjectPriority = <ProjectPriorityEntity>[];

  /// Doc Required
  TextEditingController projectPriority = TextEditingController(); // list type
  /// Doc Required
  List<ProjectTypeEntity> listOfProjectTypes = <ProjectTypeEntity>[];

  /// Doc Required
  TextEditingController projectProjectType =
      TextEditingController(); // list type
  /// Doc Required
  List<ProjectPhaseEntity> listOfProjectPhases = <ProjectPhaseEntity>[];

  /// Doc Required
  TextEditingController projectPhase = TextEditingController(); // list type
  /// Doc Required
  List<ProjectStatusEntity> listOfProjectStatuses = <ProjectStatusEntity>[];

  /// Doc Required
  TextEditingController projectStatus = TextEditingController(); // list type

  /// Doc Required
  TextEditingController projectEstimatedHours =
      TextEditingController(); // time type
  /// Doc Required
  TimeServiceModel? estimatedHours;

  /// Doc Required
  TextEditingController projectActualHours =
      TextEditingController(); // time type
  /// Doc Required
  TimeServiceModel? actualHours;

  /// Doc Required
  bool isPublic = false;

  /// Doc Required
  bool isArchived = false;

  /// Doc Required
  bool isFeatured = false;

  /// Doc Required
  FocusNode projectNameNode = FocusNode();

  /// Doc Required
  FocusNode projectDescriptionNode = FocusNode();

  /// Doc Required
  FocusNode projectStatusNode = FocusNode();

  /// Doc Required
  FocusNode projectStartDateNode = FocusNode();

  /// Doc Required
  FocusNode projectEndDateNode = FocusNode();

  /// Doc Required
  FocusNode projectBudgetNode = FocusNode();

  /// Doc Required
  FocusNode projectPriorityNode = FocusNode();

  /// Doc Required
  FocusNode projectEstimatedHoursNode = FocusNode();

  /// Doc Required
  FocusNode projectActualHoursNode = FocusNode();

  /// Doc Required
  FocusNode projectCategoryNode = FocusNode();

  /// Doc Required
  FocusNode projectProjectTypeNode = FocusNode();

  /// Doc Required
  FocusNode projectPhaseNode = FocusNode();

  /// Doc Required
  void dispose() {
    projectName.dispose();
    projectDescription.dispose();
    projectStatus.dispose();
    projectStartDate.dispose();
    projectEndDate.dispose();
    projectBudget.dispose();
    projectPriority.dispose();
    projectEstimatedHours.dispose();
    projectActualHours.dispose();
    projectCategory.dispose();
    projectProjectType.dispose();
    projectPhase.dispose();

    projectNameNode.dispose();
    projectDescriptionNode.dispose();
    projectStatusNode.dispose();
    projectStartDateNode.dispose();
    projectEndDateNode.dispose();
    projectBudgetNode.dispose();
    projectPriorityNode.dispose();
    projectEstimatedHoursNode.dispose();
    projectActualHoursNode.dispose();
    projectCategoryNode.dispose();
    projectProjectTypeNode.dispose();
    projectPhaseNode.dispose();
  }
}
