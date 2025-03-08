// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationEntity {
  int get id;
  int get userId;
  String get uuid;
  int get createdAt;
  int get updatedAt;
  String get title;
  String? get message;
  String get type;
  String get status;
  bool get isSeen;
  bool get isArchived;
  String get priority;
  DateTime? get sentAt;
  DateTime? get readAt;
  DateTime? get archivedAt;
  String? get url;
  String? get icon;
  Map<String, dynamic>? get metadata;
  String? get metadataAction;
  String? get metadataTarget;
  int get flags;
  String get platform;
  int get clickCount;
  int get retryCount;
  double? get deliveryTime;
  int? get responseCode;
  DateTime? get deletedAt;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationEntityCopyWith<NotificationEntity> get copyWith =>
      _$NotificationEntityCopyWithImpl<NotificationEntity>(
          this as NotificationEntity, _$identity);

  /// Serializes this NotificationEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.metadataAction, metadataAction) ||
                other.metadataAction == metadataAction) &&
            (identical(other.metadataTarget, metadataTarget) ||
                other.metadataTarget == metadataTarget) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        uuid,
        createdAt,
        updatedAt,
        title,
        message,
        type,
        status,
        isSeen,
        isArchived,
        priority,
        sentAt,
        readAt,
        archivedAt,
        url,
        icon,
        const DeepCollectionEquality().hash(metadata),
        metadataAction,
        metadataTarget,
        flags,
        platform,
        clickCount,
        retryCount,
        deliveryTime,
        responseCode,
        deletedAt
      ]);

  @override
  String toString() {
    return 'NotificationEntity(id: $id, userId: $userId, uuid: $uuid, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, message: $message, type: $type, status: $status, isSeen: $isSeen, isArchived: $isArchived, priority: $priority, sentAt: $sentAt, readAt: $readAt, archivedAt: $archivedAt, url: $url, icon: $icon, metadata: $metadata, metadataAction: $metadataAction, metadataTarget: $metadataTarget, flags: $flags, platform: $platform, clickCount: $clickCount, retryCount: $retryCount, deliveryTime: $deliveryTime, responseCode: $responseCode, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $NotificationEntityCopyWith<$Res> {
  factory $NotificationEntityCopyWith(
          NotificationEntity value, $Res Function(NotificationEntity) _then) =
      _$NotificationEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int userId,
      String uuid,
      int createdAt,
      int updatedAt,
      String title,
      String? message,
      String type,
      String status,
      bool isSeen,
      bool isArchived,
      String priority,
      DateTime? sentAt,
      DateTime? readAt,
      DateTime? archivedAt,
      String? url,
      String? icon,
      Map<String, dynamic>? metadata,
      String? metadataAction,
      String? metadataTarget,
      int flags,
      String platform,
      int clickCount,
      int retryCount,
      double? deliveryTime,
      int? responseCode,
      DateTime? deletedAt});
}

/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._self, this._then);

  final NotificationEntity _self;
  final $Res Function(NotificationEntity) _then;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? uuid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = null,
    Object? message = freezed,
    Object? type = null,
    Object? status = null,
    Object? isSeen = null,
    Object? isArchived = null,
    Object? priority = null,
    Object? sentAt = freezed,
    Object? readAt = freezed,
    Object? archivedAt = freezed,
    Object? url = freezed,
    Object? icon = freezed,
    Object? metadata = freezed,
    Object? metadataAction = freezed,
    Object? metadataTarget = freezed,
    Object? flags = null,
    Object? platform = null,
    Object? clickCount = null,
    Object? retryCount = null,
    Object? deliveryTime = freezed,
    Object? responseCode = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _self.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _self.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      archivedAt: freezed == archivedAt
          ? _self.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataAction: freezed == metadataAction
          ? _self.metadataAction
          : metadataAction // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataTarget: freezed == metadataTarget
          ? _self.metadataTarget
          : metadataTarget // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: null == flags
          ? _self.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      clickCount: null == clickCount
          ? _self.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
      retryCount: null == retryCount
          ? _self.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: freezed == deliveryTime
          ? _self.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      responseCode: freezed == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationEntity extends NotificationEntity {
  const _NotificationEntity(
      {required this.id,
      required this.userId,
      required this.uuid,
      required this.createdAt,
      required this.updatedAt,
      this.title = 'New Notification',
      this.message,
      this.type = 'general',
      this.status = 'unread',
      this.isSeen = false,
      this.isArchived = false,
      this.priority = 'medium',
      this.sentAt,
      this.readAt,
      this.archivedAt,
      this.url,
      this.icon,
      final Map<String, dynamic>? metadata,
      this.metadataAction,
      this.metadataTarget,
      this.flags = 0,
      this.platform = 'web',
      this.clickCount = 0,
      this.retryCount = 0,
      this.deliveryTime,
      this.responseCode,
      this.deletedAt})
      : _metadata = metadata,
        super._();
  factory _NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String uuid;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  @override
  @JsonKey()
  final String title;
  @override
  final String? message;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final bool isSeen;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final String priority;
  @override
  final DateTime? sentAt;
  @override
  final DateTime? readAt;
  @override
  final DateTime? archivedAt;
  @override
  final String? url;
  @override
  final String? icon;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? metadataAction;
  @override
  final String? metadataTarget;
  @override
  @JsonKey()
  final int flags;
  @override
  @JsonKey()
  final String platform;
  @override
  @JsonKey()
  final int clickCount;
  @override
  @JsonKey()
  final int retryCount;
  @override
  final double? deliveryTime;
  @override
  final int? responseCode;
  @override
  final DateTime? deletedAt;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationEntityCopyWith<_NotificationEntity> get copyWith =>
      __$NotificationEntityCopyWithImpl<_NotificationEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.metadataAction, metadataAction) ||
                other.metadataAction == metadataAction) &&
            (identical(other.metadataTarget, metadataTarget) ||
                other.metadataTarget == metadataTarget) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        uuid,
        createdAt,
        updatedAt,
        title,
        message,
        type,
        status,
        isSeen,
        isArchived,
        priority,
        sentAt,
        readAt,
        archivedAt,
        url,
        icon,
        const DeepCollectionEquality().hash(_metadata),
        metadataAction,
        metadataTarget,
        flags,
        platform,
        clickCount,
        retryCount,
        deliveryTime,
        responseCode,
        deletedAt
      ]);

  @override
  String toString() {
    return 'NotificationEntity(id: $id, userId: $userId, uuid: $uuid, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, message: $message, type: $type, status: $status, isSeen: $isSeen, isArchived: $isArchived, priority: $priority, sentAt: $sentAt, readAt: $readAt, archivedAt: $archivedAt, url: $url, icon: $icon, metadata: $metadata, metadataAction: $metadataAction, metadataTarget: $metadataTarget, flags: $flags, platform: $platform, clickCount: $clickCount, retryCount: $retryCount, deliveryTime: $deliveryTime, responseCode: $responseCode, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationEntityCopyWith<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  factory _$NotificationEntityCopyWith(
          _NotificationEntity value, $Res Function(_NotificationEntity) _then) =
      __$NotificationEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String uuid,
      int createdAt,
      int updatedAt,
      String title,
      String? message,
      String type,
      String status,
      bool isSeen,
      bool isArchived,
      String priority,
      DateTime? sentAt,
      DateTime? readAt,
      DateTime? archivedAt,
      String? url,
      String? icon,
      Map<String, dynamic>? metadata,
      String? metadataAction,
      String? metadataTarget,
      int flags,
      String platform,
      int clickCount,
      int retryCount,
      double? deliveryTime,
      int? responseCode,
      DateTime? deletedAt});
}

/// @nodoc
class __$NotificationEntityCopyWithImpl<$Res>
    implements _$NotificationEntityCopyWith<$Res> {
  __$NotificationEntityCopyWithImpl(this._self, this._then);

  final _NotificationEntity _self;
  final $Res Function(_NotificationEntity) _then;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? uuid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = null,
    Object? message = freezed,
    Object? type = null,
    Object? status = null,
    Object? isSeen = null,
    Object? isArchived = null,
    Object? priority = null,
    Object? sentAt = freezed,
    Object? readAt = freezed,
    Object? archivedAt = freezed,
    Object? url = freezed,
    Object? icon = freezed,
    Object? metadata = freezed,
    Object? metadataAction = freezed,
    Object? metadataTarget = freezed,
    Object? flags = null,
    Object? platform = null,
    Object? clickCount = null,
    Object? retryCount = null,
    Object? deliveryTime = freezed,
    Object? responseCode = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_NotificationEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _self.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _self.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      archivedAt: freezed == archivedAt
          ? _self.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataAction: freezed == metadataAction
          ? _self.metadataAction
          : metadataAction // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataTarget: freezed == metadataTarget
          ? _self.metadataTarget
          : metadataTarget // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: null == flags
          ? _self.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      clickCount: null == clickCount
          ? _self.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
      retryCount: null == retryCount
          ? _self.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: freezed == deliveryTime
          ? _self.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      responseCode: freezed == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
