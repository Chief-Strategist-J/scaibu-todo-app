// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentEntity {
  int get id;
  String get content;
  int get postId;
  int get userId;
  DateTime get createdAt;
  DateTime get updatedAt;
  String get status;
  Map<String, dynamic>? get metadata;
  String? get metadataApprovedBy;
  DateTime? get approvedAt;
  DateTime? get deletedAt;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentEntityCopyWith<CommentEntity> get copyWith =>
      _$CommentEntityCopyWithImpl<CommentEntity>(
          this as CommentEntity, _$identity);

  /// Serializes this CommentEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.metadataApprovedBy, metadataApprovedBy) ||
                other.metadataApprovedBy == metadataApprovedBy) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      postId,
      userId,
      createdAt,
      updatedAt,
      status,
      const DeepCollectionEquality().hash(metadata),
      metadataApprovedBy,
      approvedAt,
      deletedAt);

  @override
  String toString() {
    return 'CommentEntity(id: $id, content: $content, postId: $postId, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, metadata: $metadata, metadataApprovedBy: $metadataApprovedBy, approvedAt: $approvedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $CommentEntityCopyWith<$Res> {
  factory $CommentEntityCopyWith(
          CommentEntity value, $Res Function(CommentEntity) _then) =
      _$CommentEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String content,
      int postId,
      int userId,
      DateTime createdAt,
      DateTime updatedAt,
      String status,
      Map<String, dynamic>? metadata,
      String? metadataApprovedBy,
      DateTime? approvedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$CommentEntityCopyWithImpl<$Res>
    implements $CommentEntityCopyWith<$Res> {
  _$CommentEntityCopyWithImpl(this._self, this._then);

  final CommentEntity _self;
  final $Res Function(CommentEntity) _then;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? postId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? metadata = freezed,
    Object? metadataApprovedBy = freezed,
    Object? approvedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataApprovedBy: freezed == metadataApprovedBy
          ? _self.metadataApprovedBy
          : metadataApprovedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _self.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CommentEntity implements CommentEntity {
  const _CommentEntity(
      {required this.id,
      required this.content,
      required this.postId,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      this.status = 'pending',
      final Map<String, dynamic>? metadata,
      this.metadataApprovedBy,
      this.approvedAt,
      this.deletedAt})
      : _metadata = metadata;
  factory _CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  final int postId;
  @override
  final int userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String status;
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
  final String? metadataApprovedBy;
  @override
  final DateTime? approvedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentEntityCopyWith<_CommentEntity> get copyWith =>
      __$CommentEntityCopyWithImpl<_CommentEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.metadataApprovedBy, metadataApprovedBy) ||
                other.metadataApprovedBy == metadataApprovedBy) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      postId,
      userId,
      createdAt,
      updatedAt,
      status,
      const DeepCollectionEquality().hash(_metadata),
      metadataApprovedBy,
      approvedAt,
      deletedAt);

  @override
  String toString() {
    return 'CommentEntity(id: $id, content: $content, postId: $postId, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, metadata: $metadata, metadataApprovedBy: $metadataApprovedBy, approvedAt: $approvedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$CommentEntityCopyWith<$Res>
    implements $CommentEntityCopyWith<$Res> {
  factory _$CommentEntityCopyWith(
          _CommentEntity value, $Res Function(_CommentEntity) _then) =
      __$CommentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      int postId,
      int userId,
      DateTime createdAt,
      DateTime updatedAt,
      String status,
      Map<String, dynamic>? metadata,
      String? metadataApprovedBy,
      DateTime? approvedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$CommentEntityCopyWithImpl<$Res>
    implements _$CommentEntityCopyWith<$Res> {
  __$CommentEntityCopyWithImpl(this._self, this._then);

  final _CommentEntity _self;
  final $Res Function(_CommentEntity) _then;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? postId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? metadata = freezed,
    Object? metadataApprovedBy = freezed,
    Object? approvedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_CommentEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataApprovedBy: freezed == metadataApprovedBy
          ? _self.metadataApprovedBy
          : metadataApprovedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _self.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
