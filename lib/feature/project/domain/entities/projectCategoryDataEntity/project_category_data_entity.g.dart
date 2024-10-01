// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_category_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectCategoryEntityImpl _$$ProjectCategoryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectCategoryEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectCategoryEntityImplToJson(
        _$ProjectCategoryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectPhaseEntityImpl _$$ProjectPhaseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectPhaseEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectPhaseEntityImplToJson(
        _$ProjectPhaseEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectPriorityEntityImpl _$$ProjectPriorityEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectPriorityEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectPriorityEntityImplToJson(
        _$ProjectPriorityEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectTypeEntityImpl _$$ProjectTypeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTypeEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectTypeEntityImplToJson(
        _$ProjectTypeEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectStatusEntityImpl _$$ProjectStatusEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectStatusEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectStatusEntityImplToJson(
        _$ProjectStatusEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectCategoryDataEntityImpl _$$ProjectCategoryDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectCategoryDataEntityImpl(
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

Map<String, dynamic> _$$ProjectCategoryDataEntityImplToJson(
        _$ProjectCategoryDataEntityImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'phases': instance.phases,
      'priorities': instance.priorities,
      'types': instance.types,
      'statuses': instance.statuses,
    };

_$ProjectCategoryDataModelEntityImpl
    _$$ProjectCategoryDataModelEntityImplFromJson(Map<String, dynamic> json) =>
        _$ProjectCategoryDataModelEntityImpl(
          message: json['message'] as String?,
          status: json['status'] as bool?,
          data: json['data'] == null
              ? null
              : ProjectCategoryDataEntity.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ProjectCategoryDataModelEntityImplToJson(
        _$ProjectCategoryDataModelEntityImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
