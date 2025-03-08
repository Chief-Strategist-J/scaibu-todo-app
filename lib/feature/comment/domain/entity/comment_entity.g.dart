// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    _CommentEntity(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      postId: (json['postId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: json['status'] as String? ?? 'pending',
      metadata: json['metadata'] as Map<String, dynamic>?,
      metadataApprovedBy: json['metadataApprovedBy'] as String?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$CommentEntityToJson(_CommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'postId': instance.postId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': instance.status,
      'metadata': instance.metadata,
      'metadataApprovedBy': instance.metadataApprovedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
