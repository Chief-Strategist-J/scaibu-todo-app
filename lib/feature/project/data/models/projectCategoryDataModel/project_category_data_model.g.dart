// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_category_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectCategoryImpl _$$ProjectCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectCategoryImplToJson(
        _$ProjectCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectPhaseImpl _$$ProjectPhaseImplFromJson(Map<String, dynamic> json) =>
    _$ProjectPhaseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectPhaseImplToJson(_$ProjectPhaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectPriorityImpl _$$ProjectPriorityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectPriorityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectPriorityImplToJson(
        _$ProjectPriorityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectTypeImpl _$$ProjectTypeImplFromJson(Map<String, dynamic> json) =>
    _$ProjectTypeImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectTypeImplToJson(_$ProjectTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectStatusImpl _$$ProjectStatusImplFromJson(Map<String, dynamic> json) =>
    _$ProjectStatusImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProjectStatusImplToJson(_$ProjectStatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProjectCategoryDataImpl _$$ProjectCategoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectCategoryDataImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => ProjectCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      phases: (json['phases'] as List<dynamic>?)
          ?.map((e) => ProjectPhase.fromJson(e as Map<String, dynamic>))
          .toList(),
      priorities: (json['priorities'] as List<dynamic>?)
          ?.map((e) => ProjectPriority.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => ProjectType.fromJson(e as Map<String, dynamic>))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => ProjectStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectCategoryDataImplToJson(
        _$ProjectCategoryDataImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'phases': instance.phases,
      'priorities': instance.priorities,
      'types': instance.types,
      'statuses': instance.statuses,
    };

_$ProjectCategoryDataModelImpl _$$ProjectCategoryDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectCategoryDataModelImpl(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : ProjectCategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectCategoryDataModelImplToJson(
        _$ProjectCategoryDataModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
