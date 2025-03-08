import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_category_data_model.freezed.dart';

part 'project_category_data_model.g.dart';

/// Doc Required
mixin CategoryMixin {
  /// Doc Required
  int? get id;

  /// Doc Required
  String? get name;
}

/// Doc Required
mixin PhaseMixin {
  /// Doc Required
  int? get id;

  /// Doc Required
  String? get name;
}

/// Doc Required
mixin PriorityMixin {
  /// Doc Required
  int? get id;

  /// Doc Required
  String? get name;
}

/// Doc Required
mixin TypeMixin {
  /// Doc Required
  int? get id;

  /// Doc Required
  String? get name;
}

/// Doc Required
mixin StatusMixin {
  /// Doc Required
  int? get id;

  /// Doc Required
  String? get name;
}

/// Doc Required
@freezed
abstract class ProjectCategory with _$ProjectCategory, CategoryMixin {
  /// Doc Required
  const factory ProjectCategory({
    final int? id,
    final String? name,
  }) = _ProjectCategory;

  const ProjectCategory._();

  /// Doc Required
  factory ProjectCategory.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectPhase with _$ProjectPhase, PhaseMixin {
  /// Doc Required
  const factory ProjectPhase({
    final int? id,
    final String? name,
  }) = _ProjectPhase;

  ProjectPhase._();

  /// Doc Required
  factory ProjectPhase.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPhaseFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectPriority with _$ProjectPriority, PriorityMixin {
  /// Doc Required
  const factory ProjectPriority({
    final int? id,
    final String? name,
  }) = _ProjectPriority;

  ProjectPriority._();

  /// Doc Required
  factory ProjectPriority.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPriorityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectType with _$ProjectType, TypeMixin {
  /// Doc Required
  const factory ProjectType({
    final int? id,
    final String? name,
  }) = _ProjectType;

  ProjectType._();

  /// Doc Required
  factory ProjectType.fromJson(final Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectStatus with _$ProjectStatus, StatusMixin {
  /// Doc Required
  const factory ProjectStatus({
    final int? id,
    final String? name,
  }) = _ProjectStatus;

  ProjectStatus._();

  /// Doc Required
  factory ProjectStatus.fromJson(final Map<String, dynamic> json) =>
      _$ProjectStatusFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectCategoryData with _$ProjectCategoryData {
  /// Doc Required
  const factory ProjectCategoryData({
    final List<ProjectCategory>? categories,
    final List<ProjectPhase>? phases,
    final List<ProjectPriority>? priorities,
    final List<ProjectType>? types,
    final List<ProjectStatus>? statuses,
  }) = _ProjectCategoryData;

  /// Doc Required
  factory ProjectCategoryData.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryDataFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectCategoryDataModel with _$ProjectCategoryDataModel {
  /// Doc Required
  const factory ProjectCategoryDataModel({
    final String? message,
    final bool? status,
    final ProjectCategoryData? data,
  }) = _ProjectCategoryDataModel;

  /// Doc Required
  factory ProjectCategoryDataModel.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelFromJson(json);
}
