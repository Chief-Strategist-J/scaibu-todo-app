import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_category_data_entity.freezed.dart';

part 'project_category_data_entity.g.dart';

/// Doc Required
@freezed
abstract class ProjectCategoryEntity with _$ProjectCategoryEntity {
  /// Doc Required
  const factory ProjectCategoryEntity({
    final int? id,
    final String? name,
  }) = _ProjectCategoryEntity;

  /// Doc Required
  factory ProjectCategoryEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryEntityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectPhaseEntity with _$ProjectPhaseEntity {
  /// Doc Required
  const factory ProjectPhaseEntity({
    final int? id,
    final String? name,
  }) = _ProjectPhaseEntity;

  /// Doc Required
  factory ProjectPhaseEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPhaseEntityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectPriorityEntity with _$ProjectPriorityEntity {
  /// Doc Required
  const factory ProjectPriorityEntity({
    final int? id,
    final String? name,
  }) = _ProjectPriorityEntity;

  /// Doc Required
  factory ProjectPriorityEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPriorityEntityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectTypeEntity with _$ProjectTypeEntity {
  /// Doc Required
  const factory ProjectTypeEntity({
    final int? id,
    final String? name,
  }) = _ProjectTypeEntity;

  /// Doc Required
  factory ProjectTypeEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectTypeEntityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectStatusEntity with _$ProjectStatusEntity {
  /// Doc Required
  const factory ProjectStatusEntity({
    final int? id,
    final String? name,
  }) = _ProjectStatusEntity;

  /// Doc Required
  factory ProjectStatusEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectStatusEntityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectCategoryDataEntity with _$ProjectCategoryDataEntity {
  /// Doc Required
  const factory ProjectCategoryDataEntity({
    final List<ProjectCategoryEntity>? categories,
    final List<ProjectPhaseEntity>? phases,
    final List<ProjectPriorityEntity>? priorities,
    final List<ProjectTypeEntity>? types,
    final List<ProjectStatusEntity>? statuses,
  }) = _ProjectCategoryDataEntity;

  /// Doc Required
  factory ProjectCategoryDataEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryDataEntityFromJson(json);
}

/// Doc Required
@freezed
abstract class ProjectCategoryDataModelEntity
    with _$ProjectCategoryDataModelEntity {
  /// Doc Required
  const factory ProjectCategoryDataModelEntity({
    final String? message,
    final bool? status,
    final ProjectCategoryDataEntity? data,
  }) = _ProjectCategoryDataModelEntity;

  /// Doc Required
  factory ProjectCategoryDataModelEntity.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$ProjectCategoryDataModelEntityFromJson(json);
}
