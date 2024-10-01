import 'package:flutter/cupertino.dart';
import 'package:todo_app/feature/project/domain/entities/projectCategoryDataEntity/project_category_data_entity.dart';

class ProjectPageParam {
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();

  TextEditingController projectStartDate = TextEditingController(); // date type
  TextEditingController projectEndDate = TextEditingController(); // date type

  TextEditingController projectBudget = TextEditingController(); // list type and int type

  List<ProjectCategoryEntity> listOfProjectCategories = [];
  TextEditingController projectCategory = TextEditingController(); // list type

  List<ProjectPriorityEntity> listOfProjectPriority = [];
  TextEditingController projectPriority = TextEditingController(); // list type

  List<ProjectTypeEntity> listOfProjectTypes = [];
  TextEditingController projectProjectType = TextEditingController(); // list type

  List<ProjectPhaseEntity> listOfProjectPhases = [];
  TextEditingController projectPhase = TextEditingController(); // list type

  List<ProjectStatusEntity> listOfProjectStatuses = [];
  TextEditingController projectStatus = TextEditingController(); // list type

  TextEditingController projectEstimatedHours = TextEditingController(); // time type
  TextEditingController projectActualHours = TextEditingController(); // time type

  TextEditingController projectIsPublic = TextEditingController(); // true/false type
  TextEditingController projectIsArchived = TextEditingController(); // true/false type
  TextEditingController projectIsFeatured = TextEditingController(); // true/false type

  FocusNode projectNameNode = FocusNode();
  FocusNode projectDescriptionNode = FocusNode();
  FocusNode projectStatusNode = FocusNode();
  FocusNode projectStartDateNode = FocusNode();
  FocusNode projectEndDateNode = FocusNode();
  FocusNode projectBudgetNode = FocusNode();
  FocusNode projectPriorityNode = FocusNode();
  FocusNode projectIsPublicNode = FocusNode();
  FocusNode projectEstimatedHoursNode = FocusNode();
  FocusNode projectActualHoursNode = FocusNode();
  FocusNode projectCategoryNode = FocusNode();
  FocusNode projectIsArchivedNode = FocusNode();
  FocusNode projectIsFeaturedNode = FocusNode();
  FocusNode projectProjectTypeNode = FocusNode();
  FocusNode projectPhaseNode = FocusNode();

  bool isPublic = false;

  bool isArchived = false;

  bool isFeatured = false;

  void dispose() {
    projectName.dispose();
    projectDescription.dispose();
    projectStatus.dispose();
    projectStartDate.dispose();
    projectEndDate.dispose();
    projectBudget.dispose();
    projectPriority.dispose();
    projectIsPublic.dispose();
    projectEstimatedHours.dispose();
    projectActualHours.dispose();
    projectCategory.dispose();
    projectIsArchived.dispose();
    projectIsFeatured.dispose();
    projectProjectType.dispose();
    projectPhase.dispose();

    projectNameNode.dispose();
    projectDescriptionNode.dispose();
    projectStatusNode.dispose();
    projectStartDateNode.dispose();
    projectEndDateNode.dispose();
    projectBudgetNode.dispose();
    projectPriorityNode.dispose();
    projectIsPublicNode.dispose();
    projectEstimatedHoursNode.dispose();
    projectActualHoursNode.dispose();
    projectCategoryNode.dispose();
    projectIsArchivedNode.dispose();
    projectIsFeaturedNode.dispose();
    projectProjectTypeNode.dispose();
    projectPhaseNode.dispose();
  }
}
