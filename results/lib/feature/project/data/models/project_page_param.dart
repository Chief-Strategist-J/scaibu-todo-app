import 'package:todo_app/core/app_library.dart';

class ProjectPageParam {
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();

  TextEditingController projectStartDate = TextEditingController(); // date type
  TimeServiceModel? startDate;
  TextEditingController projectEndDate = TextEditingController(); // date type
  TimeServiceModel? endDate;

  TextEditingController projectBudget =
      TextEditingController(); // list type and int type

  List<ProjectCategoryEntity> listOfProjectCategories = [];
  TextEditingController projectCategory = TextEditingController(); // list type

  List<ProjectPriorityEntity> listOfProjectPriority = [];
  TextEditingController projectPriority = TextEditingController(); // list type

  List<ProjectTypeEntity> listOfProjectTypes = [];
  TextEditingController projectProjectType =
      TextEditingController(); // list type

  List<ProjectPhaseEntity> listOfProjectPhases = [];
  TextEditingController projectPhase = TextEditingController(); // list type

  List<ProjectStatusEntity> listOfProjectStatuses = [];
  TextEditingController projectStatus = TextEditingController(); // list type

  TextEditingController projectEstimatedHours =
      TextEditingController(); // time type
  TimeServiceModel? estimatedHours;

  TextEditingController projectActualHours =
      TextEditingController(); // time type
  TimeServiceModel? actualHours;

  bool isPublic = false;
  bool isArchived = false;
  bool isFeatured = false;

  FocusNode projectNameNode = FocusNode();
  FocusNode projectDescriptionNode = FocusNode();
  FocusNode projectStatusNode = FocusNode();
  FocusNode projectStartDateNode = FocusNode();
  FocusNode projectEndDateNode = FocusNode();
  FocusNode projectBudgetNode = FocusNode();
  FocusNode projectPriorityNode = FocusNode();

  FocusNode projectEstimatedHoursNode = FocusNode();
  FocusNode projectActualHoursNode = FocusNode();
  FocusNode projectCategoryNode = FocusNode();

  FocusNode projectProjectTypeNode = FocusNode();
  FocusNode projectPhaseNode = FocusNode();

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
