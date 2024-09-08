// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get isSeen => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  DateTime? get sentAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get archivedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get metadataAction => throw _privateConstructorUsedError;
  String? get metadataTarget => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  int get clickCount => throw _privateConstructorUsedError;
  int get retryCount => throw _privateConstructorUsedError;
  double? get deliveryTime => throw _privateConstructorUsedError;
  int? get responseCode => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {int id,
      int userId,
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
      DateTime? deletedAt,
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
      String uuid,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
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
    Object? deletedAt = freezed,
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
    Object? uuid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      archivedAt: freezed == archivedAt
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataAction: freezed == metadataAction
          ? _value.metadataAction
          : metadataAction // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataTarget: freezed == metadataTarget
          ? _value.metadataTarget
          : metadataTarget // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      clickCount: null == clickCount
          ? _value.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: freezed == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
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
      DateTime? deletedAt,
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
      String uuid,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
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
    Object? deletedAt = freezed,
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
    Object? uuid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$NotificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      archivedAt: freezed == archivedAt
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataAction: freezed == metadataAction
          ? _value.metadataAction
          : metadataAction // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataTarget: freezed == metadataTarget
          ? _value.metadataTarget
          : metadataTarget // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      clickCount: null == clickCount
          ? _value.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: freezed == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  const _$NotificationModelImpl(
      {required this.id,
      required this.userId,
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
      this.deletedAt,
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
      required this.uuid,
      required this.createdAt,
      required this.updatedAt})
      : _metadata = metadata;

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
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
  final DateTime? deletedAt;
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
  final String uuid;
  @override
  final int createdAt;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'NotificationModel(id: $id, userId: $userId, title: $title, message: $message, type: $type, status: $status, isSeen: $isSeen, isArchived: $isArchived, priority: $priority, sentAt: $sentAt, readAt: $readAt, archivedAt: $archivedAt, deletedAt: $deletedAt, url: $url, icon: $icon, metadata: $metadata, metadataAction: $metadataAction, metadataTarget: $metadataTarget, flags: $flags, platform: $platform, clickCount: $clickCount, retryCount: $retryCount, deliveryTime: $deliveryTime, responseCode: $responseCode, uuid: $uuid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
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
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
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
        deletedAt,
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
        uuid,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
      {required final int id,
      required final int userId,
      final String title,
      final String? message,
      final String type,
      final String status,
      final bool isSeen,
      final bool isArchived,
      final String priority,
      final DateTime? sentAt,
      final DateTime? readAt,
      final DateTime? archivedAt,
      final DateTime? deletedAt,
      final String? url,
      final String? icon,
      final Map<String, dynamic>? metadata,
      final String? metadataAction,
      final String? metadataTarget,
      final int flags,
      final String platform,
      final int clickCount,
      final int retryCount,
      final double? deliveryTime,
      final int? responseCode,
      required final String uuid,
      required final int createdAt,
      required final int updatedAt}) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get title;
  @override
  String? get message;
  @override
  String get type;
  @override
  String get status;
  @override
  bool get isSeen;
  @override
  bool get isArchived;
  @override
  String get priority;
  @override
  DateTime? get sentAt;
  @override
  DateTime? get readAt;
  @override
  DateTime? get archivedAt;
  @override
  DateTime? get deletedAt;
  @override
  String? get url;
  @override
  String? get icon;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get metadataAction;
  @override
  String? get metadataTarget;
  @override
  int get flags;
  @override
  String get platform;
  @override
  int get clickCount;
  @override
  int get retryCount;
  @override
  double? get deliveryTime;
  @override
  int? get responseCode;
  @override
  String get uuid;
  @override
  int get createdAt;
  @override
  int get updatedAt;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
