import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_category_data_model.freezed.dart';
part 'project_category_data_model.g.dart';

mixin CategoryMixin {
  int? get id;
  String? get name;
}

mixin PhaseMixin {
  int? get id;
  String? get name;
}

mixin PriorityMixin {
  int? get id;
  String? get name;
}

mixin TypeMixin {
  int? get id;
  String? get name;
}

mixin StatusMixin {
  int? get id;
  String? get name;
}


@freezed
class ProjectCategory with _$ProjectCategory, CategoryMixin {
  const factory ProjectCategory({
    int? id,
    String? name,
  }) = _ProjectCategory;

  factory ProjectCategory.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryFromJson(json);
}

@freezed
class ProjectPhase with _$ProjectPhase, PhaseMixin {
  const factory ProjectPhase({
    int? id,
    String? name,
  }) = _ProjectPhase;

  factory ProjectPhase.fromJson(Map<String, dynamic> json) =>
      _$ProjectPhaseFromJson(json);
}

@freezed
class ProjectPriority with _$ProjectPriority, PriorityMixin {
  const factory ProjectPriority({
    int? id,
    String? name,
  }) = _ProjectPriority;

  factory ProjectPriority.fromJson(Map<String, dynamic> json) =>
      _$ProjectPriorityFromJson(json);
}

@freezed
class ProjectType with _$ProjectType, TypeMixin {
  const factory ProjectType({
    int? id,
    String? name,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}

@freezed
class ProjectStatus with _$ProjectStatus, StatusMixin {
  const factory ProjectStatus({
    int? id,
    String? name,
  }) = _ProjectStatus;

  factory ProjectStatus.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatusFromJson(json);
}

@freezed
class ProjectCategoryData with _$ProjectCategoryData {
  const factory ProjectCategoryData({
    List<ProjectCategory>? categories,
    List<ProjectPhase>? phases,
    List<ProjectPriority>? priorities,
    List<ProjectType>? types,
    List<ProjectStatus>? statuses,
  }) = _ProjectCategoryData;

  factory ProjectCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataFromJson(json);
}

@freezed
class ProjectCategoryDataModel with _$ProjectCategoryDataModel {
  const factory ProjectCategoryDataModel({
    String? message,
    bool? status,
    ProjectCategoryData? data,
  }) = _ProjectCategoryDataModel;

  factory ProjectCategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelFromJson(json);
}
