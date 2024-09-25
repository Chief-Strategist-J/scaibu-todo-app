import 'package:flutter/cupertino.dart';

class ProjectPageParam {
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  TextEditingController projectStatus = TextEditingController();
  TextEditingController projectStartDate = TextEditingController();
  TextEditingController projectEndDate = TextEditingController();
  TextEditingController projectBudget = TextEditingController();
  TextEditingController projectPriority = TextEditingController();
  TextEditingController projectIsPublic = TextEditingController();
  TextEditingController projectEstimatedHours = TextEditingController();
  TextEditingController projectActualHours = TextEditingController();
  TextEditingController projectCategory = TextEditingController();
  TextEditingController projectIsArchived = TextEditingController();
  TextEditingController projectIsFeatured = TextEditingController();
  TextEditingController projectProjectType = TextEditingController();
  TextEditingController projectPhase = TextEditingController();

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
  }
}
