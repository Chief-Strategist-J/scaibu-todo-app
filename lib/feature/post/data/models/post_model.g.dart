// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      slug: json['slug'] as String,
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

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'slug': instance.slug,
      'content': instance.content,
      'status': instance.status,
      'metadata': instance.metadata,
      'metadataAuthor': instance.metadataAuthor,
      'metadataCategory': instance.metadataCategory,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
