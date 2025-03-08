// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_category_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectCategory _$ProjectCategoryFromJson(Map<String, dynamic> json) =>
    _ProjectCategory(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectCategoryToJson(_ProjectCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectPhase _$ProjectPhaseFromJson(Map<String, dynamic> json) =>
    _ProjectPhase(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectPhaseToJson(_ProjectPhase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectPriority _$ProjectPriorityFromJson(Map<String, dynamic> json) =>
    _ProjectPriority(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectPriorityToJson(_ProjectPriority instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectType _$ProjectTypeFromJson(Map<String, dynamic> json) => _ProjectType(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectTypeToJson(_ProjectType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectStatus _$ProjectStatusFromJson(Map<String, dynamic> json) =>
    _ProjectStatus(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectStatusToJson(_ProjectStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ProjectCategoryData _$ProjectCategoryDataFromJson(Map<String, dynamic> json) =>
    _ProjectCategoryData(
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

Map<String, dynamic> _$ProjectCategoryDataToJson(
        _ProjectCategoryData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'phases': instance.phases,
      'priorities': instance.priorities,
      'types': instance.types,
      'statuses': instance.statuses,
    };

_ProjectCategoryDataModel _$ProjectCategoryDataModelFromJson(
        Map<String, dynamic> json) =>
    _ProjectCategoryDataModel(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : ProjectCategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectCategoryDataModelToJson(
        _ProjectCategoryDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
