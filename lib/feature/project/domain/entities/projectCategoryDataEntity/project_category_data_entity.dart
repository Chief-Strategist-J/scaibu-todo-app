import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_category_data_entity.freezed.dart';
part 'project_category_data_entity.g.dart';

@freezed
class ProjectCategoryEntity with _$ProjectCategoryEntity {
  const factory ProjectCategoryEntity({
    int? id,
    String? name,
  }) = _ProjectCategoryEntity;

  factory ProjectCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryEntityFromJson(json);
}

@freezed
class ProjectPhaseEntity with _$ProjectPhaseEntity {
  const factory ProjectPhaseEntity({
    int? id,
    String? name,
  }) = _ProjectPhaseEntity;

  factory ProjectPhaseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectPhaseEntityFromJson(json);
}

@freezed
class ProjectPriorityEntity with _$ProjectPriorityEntity {
  const factory ProjectPriorityEntity({
    int? id,
    String? name,
  }) = _ProjectPriorityEntity;

  factory ProjectPriorityEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectPriorityEntityFromJson(json);
}

@freezed
class ProjectTypeEntity with _$ProjectTypeEntity {
  const factory ProjectTypeEntity({
    int? id,
    String? name,
  }) = _ProjectTypeEntity;

  factory ProjectTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeEntityFromJson(json);
}

@freezed
class ProjectStatusEntity with _$ProjectStatusEntity {
  const factory ProjectStatusEntity({
    int? id,
    String? name,
  }) = _ProjectStatusEntity;

  factory ProjectStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatusEntityFromJson(json);
}

@freezed
class ProjectCategoryDataEntity with _$ProjectCategoryDataEntity {
  const factory ProjectCategoryDataEntity({
    List<ProjectCategoryEntity>? categories,
    List<ProjectPhaseEntity>? phases,
    List<ProjectPriorityEntity>? priorities,
    List<ProjectTypeEntity>? types,
    List<ProjectStatusEntity>? statuses,
  }) = _ProjectCategoryDataEntity;

  factory ProjectCategoryDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataEntityFromJson(json);
}

@freezed
class ProjectCategoryDataModelEntity with _$ProjectCategoryDataModelEntity {
  const factory ProjectCategoryDataModelEntity({
    String? message,
    bool? status,
    ProjectCategoryDataEntity? data,
  }) = _ProjectCategoryDataModelEntity;

  factory ProjectCategoryDataModelEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelEntityFromJson(json);
}
