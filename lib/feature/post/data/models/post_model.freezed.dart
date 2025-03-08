// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {
  int get id;
  String get title;
  int get userId;
  DateTime get createdAt;
  DateTime get updatedAt;
  String get slug;
  String? get content;
  String get status;
  Map<String, dynamic>? get metadata;
  String? get metadataAuthor;
  String? get metadataCategory;
  DateTime? get publishedAt;
  DateTime? get deletedAt;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<PostModel> get copyWith =>
      _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.slug, slug) || other.slug == slug) &&
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
      userId,
      createdAt,
      updatedAt,
      slug,
      content,
      status,
      const DeepCollectionEquality().hash(metadata),
      metadataAuthor,
      metadataCategory,
      publishedAt,
      deletedAt);

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, slug: $slug, content: $content, status: $status, metadata: $metadata, metadataAuthor: $metadataAuthor, metadataCategory: $metadataCategory, publishedAt: $publishedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) =
      _$PostModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      int userId,
      DateTime createdAt,
      DateTime updatedAt,
      String slug,
      String? content,
      String status,
      Map<String, dynamic>? metadata,
      String? metadataAuthor,
      String? metadataCategory,
      DateTime? publishedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res> implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? slug = null,
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
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
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
class _PostModel extends PostModel {
  const _PostModel(
      {required this.id,
      required this.title,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      required this.slug,
      this.content,
      this.status = 'draft',
      final Map<String, dynamic>? metadata,
      this.metadataAuthor,
      this.metadataCategory,
      this.publishedAt,
      this.deletedAt})
      : _metadata = metadata,
        super._();
  factory _PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String slug;
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

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostModelCopyWith<_PostModel> get copyWith =>
      __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.slug, slug) || other.slug == slug) &&
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
      userId,
      createdAt,
      updatedAt,
      slug,
      content,
      status,
      const DeepCollectionEquality().hash(_metadata),
      metadataAuthor,
      metadataCategory,
      publishedAt,
      deletedAt);

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, slug: $slug, content: $content, status: $status, metadata: $metadata, metadataAuthor: $metadataAuthor, metadataCategory: $metadataCategory, publishedAt: $publishedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(
          _PostModel value, $Res Function(_PostModel) _then) =
      __$PostModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      int userId,
      DateTime createdAt,
      DateTime updatedAt,
      String slug,
      String? content,
      String status,
      Map<String, dynamic>? metadata,
      String? metadataAuthor,
      String? metadataCategory,
      DateTime? publishedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$PostModelCopyWithImpl<$Res> implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? slug = null,
    Object? content = freezed,
    Object? status = null,
    Object? metadata = freezed,
    Object? metadataAuthor = freezed,
    Object? metadataCategory = freezed,
    Object? publishedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_PostModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
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
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
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
