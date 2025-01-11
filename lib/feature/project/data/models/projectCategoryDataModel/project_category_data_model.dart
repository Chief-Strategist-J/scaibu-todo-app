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
    final int? id,
    final String? name,
  }) = _ProjectCategory;

  factory ProjectCategory.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryFromJson(json);
}

@freezed
class ProjectPhase with _$ProjectPhase, PhaseMixin {
  const factory ProjectPhase({
    final int? id,
    final String? name,
  }) = _ProjectPhase;

  factory ProjectPhase.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPhaseFromJson(json);
}

@freezed
class ProjectPriority with _$ProjectPriority, PriorityMixin {
  const factory ProjectPriority({
    final int? id,
    final String? name,
  }) = _ProjectPriority;

  factory ProjectPriority.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPriorityFromJson(json);
}

@freezed
class ProjectType with _$ProjectType, TypeMixin {
  const factory ProjectType({
    final int? id,
    final String? name,
  }) = _ProjectType;

  factory ProjectType.fromJson(final Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}

@freezed
class ProjectStatus with _$ProjectStatus, StatusMixin {
  const factory ProjectStatus({
    final int? id,
    final String? name,
  }) = _ProjectStatus;

  factory ProjectStatus.fromJson(final Map<String, dynamic> json) =>
      _$ProjectStatusFromJson(json);
}

@freezed
class ProjectCategoryData with _$ProjectCategoryData {
  const factory ProjectCategoryData({
    final List<ProjectCategory>? categories,
    final List<ProjectPhase>? phases,
    final List<ProjectPriority>? priorities,
    final List<ProjectType>? types,
    final List<ProjectStatus>? statuses,
  }) = _ProjectCategoryData;

  factory ProjectCategoryData.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryDataFromJson(json);
}

@freezed
class ProjectCategoryDataModel with _$ProjectCategoryDataModel {
  const factory ProjectCategoryDataModel({
    final String? message,
    final bool? status,
    final ProjectCategoryData? data,
  }) = _ProjectCategoryDataModel;

  factory ProjectCategoryDataModel.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelFromJson(json);
}
