import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_category_data_entity.freezed.dart';
part 'project_category_data_entity.g.dart';

@freezed
class ProjectCategoryEntity with _$ProjectCategoryEntity {
  const factory ProjectCategoryEntity({
    final int? id,
    final String? name,
  }) = _ProjectCategoryEntity;

  factory ProjectCategoryEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryEntityFromJson(json);
}

@freezed
class ProjectPhaseEntity with _$ProjectPhaseEntity {
  const factory ProjectPhaseEntity({
    final int? id,
    final String? name,
  }) = _ProjectPhaseEntity;

  factory ProjectPhaseEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPhaseEntityFromJson(json);
}

@freezed
class ProjectPriorityEntity with _$ProjectPriorityEntity {
  const factory ProjectPriorityEntity({
    final int? id,
    final String? name,
  }) = _ProjectPriorityEntity;

  factory ProjectPriorityEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectPriorityEntityFromJson(json);
}

@freezed
class ProjectTypeEntity with _$ProjectTypeEntity {
  const factory ProjectTypeEntity({
    final int? id,
    final String? name,
  }) = _ProjectTypeEntity;

  factory ProjectTypeEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectTypeEntityFromJson(json);
}

@freezed
class ProjectStatusEntity with _$ProjectStatusEntity {
  const factory ProjectStatusEntity({
    final int? id,
    final String? name,
  }) = _ProjectStatusEntity;

  factory ProjectStatusEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectStatusEntityFromJson(json);
}

@freezed
class ProjectCategoryDataEntity with _$ProjectCategoryDataEntity {
  const factory ProjectCategoryDataEntity({
    final List<ProjectCategoryEntity>? categories,
    final List<ProjectPhaseEntity>? phases,
    final List<ProjectPriorityEntity>? priorities,
    final List<ProjectTypeEntity>? types,
    final List<ProjectStatusEntity>? statuses,
  }) = _ProjectCategoryDataEntity;

  factory ProjectCategoryDataEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectCategoryDataEntityFromJson(json);
}

@freezed
class ProjectCategoryDataModelEntity with _$ProjectCategoryDataModelEntity {
  const factory ProjectCategoryDataModelEntity({
    final String? message,
    final bool? status,
    final ProjectCategoryDataEntity? data,
  }) = _ProjectCategoryDataModelEntity;

  factory ProjectCategoryDataModelEntity.fromJson(
          final Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelEntityFromJson(json);
}
