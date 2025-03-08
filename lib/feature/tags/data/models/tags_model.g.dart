// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagsModel _$TagsModelFromJson(Map<String, dynamic> json) => _TagsModel(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      isActive: json['isActive'] as bool?,
      order: (json['order'] as num?)?.toInt(),
      version: (json['version'] as num?)?.toInt(),
      followerCount: (json['followerCount'] as num?)?.toInt(),
      usageCount: (json['usageCount'] as num?)?.toInt(),
      relatedPostsCount: (json['relatedPostsCount'] as num?)?.toInt(),
      userInteractionCount: (json['userInteractionCount'] as num?)?.toInt(),
      popularityScore: (json['popularityScore'] as num?)?.toDouble(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      metaTitle: json['metaTitle'] as String?,
      color: json['color'] as String?,
      imageUrl: json['imageUrl'] as String?,
      tagType: json['tagType'] as String?,
      contentType: json['contentType'] as String?,
      descriptionVector: json['descriptionVector'] as String?,
      metaDescription: json['metaDescription'] as String?,
      description: json['description'] as String?,
      geolocationData: json['geolocationData'] as Map<String, dynamic>?,
      metaData: json['metaData'] as Map<String, dynamic>?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdBy: (json['createdBy'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      todoId: (json['todoId'] as num?)?.toInt(),
      lastTrendUpdate: json['lastTrendUpdate'] == null
          ? null
          : DateTime.parse(json['lastTrendUpdate'] as String),
      lastUsedAt: json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TagsModelToJson(_TagsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'isActive': instance.isActive,
      'order': instance.order,
      'version': instance.version,
      'followerCount': instance.followerCount,
      'usageCount': instance.usageCount,
      'relatedPostsCount': instance.relatedPostsCount,
      'userInteractionCount': instance.userInteractionCount,
      'popularityScore': instance.popularityScore,
      'name': instance.name,
      'slug': instance.slug,
      'metaTitle': instance.metaTitle,
      'color': instance.color,
      'imageUrl': instance.imageUrl,
      'tagType': instance.tagType,
      'contentType': instance.contentType,
      'descriptionVector': instance.descriptionVector,
      'metaDescription': instance.metaDescription,
      'description': instance.description,
      'geolocationData': instance.geolocationData,
      'metaData': instance.metaData,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'parentId': instance.parentId,
      'todoId': instance.todoId,
      'lastTrendUpdate': instance.lastTrendUpdate?.toIso8601String(),
      'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
