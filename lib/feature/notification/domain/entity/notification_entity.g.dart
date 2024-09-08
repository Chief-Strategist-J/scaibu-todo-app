// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationEntityImpl _$$NotificationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationEntityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      title: json['title'] as String? ?? 'New Notification',
      message: json['message'] as String?,
      type: json['type'] as String? ?? 'general',
      status: json['status'] as String? ?? 'unread',
      isSeen: json['isSeen'] as bool? ?? false,
      isArchived: json['isArchived'] as bool? ?? false,
      priority: json['priority'] as String? ?? 'medium',
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      archivedAt: json['archivedAt'] == null
          ? null
          : DateTime.parse(json['archivedAt'] as String),
      url: json['url'] as String?,
      icon: json['icon'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      metadataAction: json['metadataAction'] as String?,
      metadataTarget: json['metadataTarget'] as String?,
      flags: (json['flags'] as num?)?.toInt() ?? 0,
      platform: json['platform'] as String? ?? 'web',
      clickCount: (json['clickCount'] as num?)?.toInt() ?? 0,
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      deliveryTime: (json['deliveryTime'] as num?)?.toDouble(),
      responseCode: (json['responseCode'] as num?)?.toInt(),
      uuid: json['uuid'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$NotificationEntityImplToJson(
        _$NotificationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
      'status': instance.status,
      'isSeen': instance.isSeen,
      'isArchived': instance.isArchived,
      'priority': instance.priority,
      'sentAt': instance.sentAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'url': instance.url,
      'icon': instance.icon,
      'metadata': instance.metadata,
      'metadataAction': instance.metadataAction,
      'metadataTarget': instance.metadataTarget,
      'flags': instance.flags,
      'platform': instance.platform,
      'clickCount': instance.clickCount,
      'retryCount': instance.retryCount,
      'deliveryTime': instance.deliveryTime,
      'responseCode': instance.responseCode,
      'uuid': instance.uuid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
