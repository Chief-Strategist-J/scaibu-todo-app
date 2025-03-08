// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostEntity {
  int get id;
  String get title;
  String get slug;
  int get userId;
  DateTime get createdAt;
  DateTime get updatedAt;
  String? get content;
  String get status;
  Map<String, dynamic>? get metadata;
  String? get metadataAuthor;
  String? get metadataCategory;
  DateTime? get publishedAt;
  DateTime? get deletedAt;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostEntityCopyWith<PostEntity> get copyWith =>
      _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);

  /// Serializes this PostEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.metadataAuthor, metadataAuthor) ||
                other.metadataAuthor == metadataAuthor) &&
            (identical(other.metadataCategory, metadataCategory) ||
                other.metadataCategory == metadataCategory) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      slug,
      userId,
      createdAt,
      updatedAt,
      content,
      status,
      const DeepCollectionEquality().hash(metadata),
      metadataAuthor,
      metadataCategory,
      publishedAt,
      deletedAt);

  @override
  String toString() {
    return 'PostEntity(id: $id, title: $title, slug: $slug, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, status: $status, metadata: $metadata, metadataAuthor: $metadataAuthor, metadataCategory: $metadataCategory, publishedAt: $publishedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res> {
  factory $PostEntityCopyWith(
          PostEntity value, $Res Function(PostEntity) _then) =
      _$PostEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      int userId,
      DateTime createdAt,
      DateTime updatedAt,
      String? content,
      String status,
      Map<String, dynamic>? metadata,
      String? metadataAuthor,
      String? metadataCategory,
      DateTime? publishedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$PostEntityCopyWithImpl<$Res> implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._self, this._then);

  final PostEntity _self;
  final $Res Function(PostEntity) _then;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? content = freezed,
    Object? status = null,
    Object? metadata = freezed,
    Object? metadataAuthor = freezed,
    Object? metadataCategory = freezed,
    Object? publishedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
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
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataAuthor: freezed == metadataAuthor
          ? _self.metadataAuthor
          : metadataAuthor // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataCategory: freezed == metadataCategory
          ? _self.metadataCategory
          : metadataCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
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
class _PostEntity implements PostEntity {
  const _PostEntity(
      {required this.id,
      required this.title,
      required this.slug,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      this.content,
      this.status = 'draft',
      final Map<String, dynamic>? metadata,
      this.metadataAuthor,
      this.metadataCategory,
      this.publishedAt,
      this.deletedAt})
      : _metadata = metadata;
  factory _PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String slug;
  @override
  final int userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? content;
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
  final String? metadataAuthor;
  @override
  final String? metadataCategory;
  @override
  final DateTime? publishedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostEntityCopyWith<_PostEntity> get copyWith =>
      __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.metadataAuthor, metadataAuthor) ||
                other.metadataAuthor == metadataAuthor) &&
            (identical(other.metadataCategory, metadataCategory) ||
                other.metadataCategory == metadataCategory) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      slug,
      userId,
      createdAt,
      updatedAt,
      content,
      status,
      const DeepCollectionEquality().hash(_metadata),
      metadataAuthor,
      metadataCategory,
      publishedAt,
      deletedAt);

  @override
  String toString() {
    return 'PostEntity(id: $id, title: $title, slug: $slug, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, status: $status, metadata: $metadata, metadataAuthor: $metadataAuthor, metadataCategory: $metadataCategory, publishedAt: $publishedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$PostEntityCopyWith<$Res>
    implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(
          _PostEntity value, $Res Function(_PostEntity) _then) =
      __$PostEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      int userId,
      DateTime createdAt,
      DateTime updatedAt,
      String? content,
      String status,
      Map<String, dynamic>? metadata,
      String? metadataAuthor,
      String? metadataCategory,
      DateTime? publishedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$PostEntityCopyWithImpl<$Res> implements _$PostEntityCopyWith<$Res> {
  __$PostEntityCopyWithImpl(this._self, this._then);

  final _PostEntity _self;
  final $Res Function(_PostEntity) _then;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? content = freezed,
    Object? status = null,
    Object? metadata = freezed,
    Object? metadataAuthor = freezed,
    Object? metadataCategory = freezed,
    Object? publishedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_PostEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
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
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadataAuthor: freezed == metadataAuthor
          ? _self.metadataAuthor
          : metadataAuthor // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataCategory: freezed == metadataCategory
          ? _self.metadataCategory
          : metadataCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
