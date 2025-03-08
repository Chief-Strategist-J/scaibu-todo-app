// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_category_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectCategoryEntity _$ProjectCategoryEntityFromJson(
        Map<String, dynamic> json) =>
    _ProjectCategoryEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectCategoryEntityToJson(
        _ProjectCategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectPhaseEntity _$ProjectPhaseEntityFromJson(Map<String, dynamic> json) =>
    _ProjectPhaseEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectPhaseEntityToJson(_ProjectPhaseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectPriorityEntity _$ProjectPriorityEntityFromJson(
        Map<String, dynamic> json) =>
    _ProjectPriorityEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectPriorityEntityToJson(
        _ProjectPriorityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectTypeEntity _$ProjectTypeEntityFromJson(Map<String, dynamic> json) =>
    _ProjectTypeEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectTypeEntityToJson(_ProjectTypeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectStatusEntity _$ProjectStatusEntityFromJson(Map<String, dynamic> json) =>
    _ProjectStatusEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectStatusEntityToJson(
        _ProjectStatusEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectCategoryDataEntity _$ProjectCategoryDataEntityFromJson(
        Map<String, dynamic> json) =>
    _ProjectCategoryDataEntity(
      categories: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => ProjectCategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      phases: (json['phases'] as List<dynamic>?)
          ?.map((e) => ProjectPhaseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      priorities: (json['priorities'] as List<dynamic>?)
          ?.map(
              (e) => ProjectPriorityEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => ProjectTypeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => ProjectStatusEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectCategoryDataEntityToJson(
        _ProjectCategoryDataEntity instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'phases': instance.phases,
      'priorities': instance.priorities,
      'types': instance.types,
      'statuses': instance.statuses,
    };

_ProjectCategoryDataModelEntity _$ProjectCategoryDataModelEntityFromJson(
        Map<String, dynamic> json) =>
    _ProjectCategoryDataModelEntity(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : ProjectCategoryDataEntity.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectCategoryDataModelEntityToJson(
        _ProjectCategoryDataModelEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
