// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostEntityImpl _$$PostEntityImplFromJson(Map<String, dynamic> json) =>
    _$PostEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      content: json['content'] as String?,
      status: json['status'] as String? ?? 'draft',
      metadata: json['metadata'] as Map<String, dynamic>?,
      metadataAuthor: json['metadataAuthor'] as String?,
      metadataCategory: json['metadataCategory'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$PostEntityImplToJson(_$PostEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'content': instance.content,
      'status': instance.status,
      'metadata': instance.metadata,
      'metadataAuthor': instance.metadataAuthor,
      'metadataCategory': instance.metadataCategory,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
