// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagsModel implements DiagnosticableTreeMixin {
  int? get id;
  String? get uuid;
  bool? get isActive;
  int? get order;
  int? get version;
  int? get followerCount;
  int? get usageCount;
  int? get relatedPostsCount;
  int? get userInteractionCount;
  double? get popularityScore;
  String? get name;
  String? get slug;
  String? get metaTitle;
  String? get color;
  String? get imageUrl;
  String? get tagType;
  String? get contentType;
  String? get descriptionVector;
  String? get metaDescription;
  String? get description;
  Map<String, dynamic>? get geolocationData;
  Map<String, dynamic>? get metaData;
  DateTime? get deletedAt;
  int? get createdBy;
  int? get parentId;
  int? get todoId;
  DateTime? get lastTrendUpdate;
  DateTime? get lastUsedAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TagsModelCopyWith<TagsModel> get copyWith =>
      _$TagsModelCopyWithImpl<TagsModel>(this as TagsModel, _$identity);

  /// Serializes this TagsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TagsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('followerCount', followerCount))
      ..add(DiagnosticsProperty('usageCount', usageCount))
      ..add(DiagnosticsProperty('relatedPostsCount', relatedPostsCount))
      ..add(DiagnosticsProperty('userInteractionCount', userInteractionCount))
      ..add(DiagnosticsProperty('popularityScore', popularityScore))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('metaTitle', metaTitle))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('tagType', tagType))
      ..add(DiagnosticsProperty('contentType', contentType))
      ..add(DiagnosticsProperty('descriptionVector', descriptionVector))
      ..add(DiagnosticsProperty('metaDescription', metaDescription))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('geolocationData', geolocationData))
      ..add(DiagnosticsProperty('metaData', metaData))
      ..add(DiagnosticsProperty('deletedAt', deletedAt))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('todoId', todoId))
      ..add(DiagnosticsProperty('lastTrendUpdate', lastTrendUpdate))
      ..add(DiagnosticsProperty('lastUsedAt', lastUsedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TagsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.relatedPostsCount, relatedPostsCount) ||
                other.relatedPostsCount == relatedPostsCount) &&
            (identical(other.userInteractionCount, userInteractionCount) ||
                other.userInteractionCount == userInteractionCount) &&
            (identical(other.popularityScore, popularityScore) ||
                other.popularityScore == popularityScore) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.descriptionVector, descriptionVector) ||
                other.descriptionVector == descriptionVector) &&
            (identical(other.metaDescription, metaDescription) ||
                other.metaDescription == metaDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.geolocationData, geolocationData) &&
            const DeepCollectionEquality().equals(other.metaData, metaData) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.lastTrendUpdate, lastTrendUpdate) ||
                other.lastTrendUpdate == lastTrendUpdate) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
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
        uuid,
        isActive,
        order,
        version,
        followerCount,
        usageCount,
        relatedPostsCount,
        userInteractionCount,
        popularityScore,
        name,
        slug,
        metaTitle,
        color,
        imageUrl,
        tagType,
        contentType,
        descriptionVector,
        metaDescription,
        description,
        const DeepCollectionEquality().hash(geolocationData),
        const DeepCollectionEquality().hash(metaData),
        deletedAt,
        createdBy,
        parentId,
        todoId,
        lastTrendUpdate,
        lastUsedAt,
        createdAt,
        updatedAt
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagsModel(id: $id, uuid: $uuid, isActive: $isActive, order: $order, version: $version, followerCount: $followerCount, usageCount: $usageCount, relatedPostsCount: $relatedPostsCount, userInteractionCount: $userInteractionCount, popularityScore: $popularityScore, name: $name, slug: $slug, metaTitle: $metaTitle, color: $color, imageUrl: $imageUrl, tagType: $tagType, contentType: $contentType, descriptionVector: $descriptionVector, metaDescription: $metaDescription, description: $description, geolocationData: $geolocationData, metaData: $metaData, deletedAt: $deletedAt, createdBy: $createdBy, parentId: $parentId, todoId: $todoId, lastTrendUpdate: $lastTrendUpdate, lastUsedAt: $lastUsedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $TagsModelCopyWith<$Res> {
  factory $TagsModelCopyWith(TagsModel value, $Res Function(TagsModel) _then) =
      _$TagsModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      bool? isActive,
      int? order,
      int? version,
      int? followerCount,
      int? usageCount,
      int? relatedPostsCount,
      int? userInteractionCount,
      double? popularityScore,
      String? name,
      String? slug,
      String? metaTitle,
      String? color,
      String? imageUrl,
      String? tagType,
      String? contentType,
      String? descriptionVector,
      String? metaDescription,
      String? description,
      Map<String, dynamic>? geolocationData,
      Map<String, dynamic>? metaData,
      DateTime? deletedAt,
      int? createdBy,
      int? parentId,
      int? todoId,
      DateTime? lastTrendUpdate,
      DateTime? lastUsedAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TagsModelCopyWithImpl<$Res> implements $TagsModelCopyWith<$Res> {
  _$TagsModelCopyWithImpl(this._self, this._then);

  final TagsModel _self;
  final $Res Function(TagsModel) _then;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? isActive = freezed,
    Object? order = freezed,
    Object? version = freezed,
    Object? followerCount = freezed,
    Object? usageCount = freezed,
    Object? relatedPostsCount = freezed,
    Object? userInteractionCount = freezed,
    Object? popularityScore = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? metaTitle = freezed,
    Object? color = freezed,
    Object? imageUrl = freezed,
    Object? tagType = freezed,
    Object? contentType = freezed,
    Object? descriptionVector = freezed,
    Object? metaDescription = freezed,
    Object? description = freezed,
    Object? geolocationData = freezed,
    Object? metaData = freezed,
    Object? deletedAt = freezed,
    Object? createdBy = freezed,
    Object? parentId = freezed,
    Object? todoId = freezed,
    Object? lastTrendUpdate = freezed,
    Object? lastUsedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      followerCount: freezed == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      usageCount: freezed == usageCount
          ? _self.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedPostsCount: freezed == relatedPostsCount
          ? _self.relatedPostsCount
          : relatedPostsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      userInteractionCount: freezed == userInteractionCount
          ? _self.userInteractionCount
          : userInteractionCount // ignore: cast_nullable_to_non_nullable
              as int?,
      popularityScore: freezed == popularityScore
          ? _self.popularityScore
          : popularityScore // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTitle: freezed == metaTitle
          ? _self.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tagType: freezed == tagType
          ? _self.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVector: freezed == descriptionVector
          ? _self.descriptionVector
          : descriptionVector // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDescription: freezed == metaDescription
          ? _self.metaDescription
          : metaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      geolocationData: freezed == geolocationData
          ? _self.geolocationData
          : geolocationData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metaData: freezed == metaData
          ? _self.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastTrendUpdate: freezed == lastTrendUpdate
          ? _self.lastTrendUpdate
          : lastTrendUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsedAt: freezed == lastUsedAt
          ? _self.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TagsModel with DiagnosticableTreeMixin implements TagsModel {
  const _TagsModel(
      {this.id,
      this.uuid,
      this.isActive,
      this.order,
      this.version,
      this.followerCount,
      this.usageCount,
      this.relatedPostsCount,
      this.userInteractionCount,
      this.popularityScore,
      this.name,
      this.slug,
      this.metaTitle,
      this.color,
      this.imageUrl,
      this.tagType,
      this.contentType,
      this.descriptionVector,
      this.metaDescription,
      this.description,
      final Map<String, dynamic>? geolocationData,
      final Map<String, dynamic>? metaData,
      this.deletedAt,
      this.createdBy,
      this.parentId,
      this.todoId,
      this.lastTrendUpdate,
      this.lastUsedAt,
      this.createdAt,
      this.updatedAt})
      : _geolocationData = geolocationData,
        _metaData = metaData;
  factory _TagsModel.fromJson(Map<String, dynamic> json) =>
      _$TagsModelFromJson(json);

  @override
  final int? id;
  @override
  final String? uuid;
  @override
  final bool? isActive;
  @override
  final int? order;
  @override
  final int? version;
  @override
  final int? followerCount;
  @override
  final int? usageCount;
  @override
  final int? relatedPostsCount;
  @override
  final int? userInteractionCount;
  @override
  final double? popularityScore;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? metaTitle;
  @override
  final String? color;
  @override
  final String? imageUrl;
  @override
  final String? tagType;
  @override
  final String? contentType;
  @override
  final String? descriptionVector;
  @override
  final String? metaDescription;
  @override
  final String? description;
  final Map<String, dynamic>? _geolocationData;
  @override
  Map<String, dynamic>? get geolocationData {
    final value = _geolocationData;
    if (value == null) return null;
    if (_geolocationData is EqualUnmodifiableMapView) return _geolocationData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _metaData;
  @override
  Map<String, dynamic>? get metaData {
    final value = _metaData;
    if (value == null) return null;
    if (_metaData is EqualUnmodifiableMapView) return _metaData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? deletedAt;
  @override
  final int? createdBy;
  @override
  final int? parentId;
  @override
  final int? todoId;
  @override
  final DateTime? lastTrendUpdate;
  @override
  final DateTime? lastUsedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TagsModelCopyWith<_TagsModel> get copyWith =>
      __$TagsModelCopyWithImpl<_TagsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TagsModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TagsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('followerCount', followerCount))
      ..add(DiagnosticsProperty('usageCount', usageCount))
      ..add(DiagnosticsProperty('relatedPostsCount', relatedPostsCount))
      ..add(DiagnosticsProperty('userInteractionCount', userInteractionCount))
      ..add(DiagnosticsProperty('popularityScore', popularityScore))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('metaTitle', metaTitle))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('tagType', tagType))
      ..add(DiagnosticsProperty('contentType', contentType))
      ..add(DiagnosticsProperty('descriptionVector', descriptionVector))
      ..add(DiagnosticsProperty('metaDescription', metaDescription))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('geolocationData', geolocationData))
      ..add(DiagnosticsProperty('metaData', metaData))
      ..add(DiagnosticsProperty('deletedAt', deletedAt))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('todoId', todoId))
      ..add(DiagnosticsProperty('lastTrendUpdate', lastTrendUpdate))
      ..add(DiagnosticsProperty('lastUsedAt', lastUsedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.relatedPostsCount, relatedPostsCount) ||
                other.relatedPostsCount == relatedPostsCount) &&
            (identical(other.userInteractionCount, userInteractionCount) ||
                other.userInteractionCount == userInteractionCount) &&
            (identical(other.popularityScore, popularityScore) ||
                other.popularityScore == popularityScore) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.tagType, tagType) || other.tagType == tagType) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.descriptionVector, descriptionVector) ||
                other.descriptionVector == descriptionVector) &&
            (identical(other.metaDescription, metaDescription) ||
                other.metaDescription == metaDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._geolocationData, _geolocationData) &&
            const DeepCollectionEquality().equals(other._metaData, _metaData) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.lastTrendUpdate, lastTrendUpdate) ||
                other.lastTrendUpdate == lastTrendUpdate) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
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
        uuid,
        isActive,
        order,
        version,
        followerCount,
        usageCount,
        relatedPostsCount,
        userInteractionCount,
        popularityScore,
        name,
        slug,
        metaTitle,
        color,
        imageUrl,
        tagType,
        contentType,
        descriptionVector,
        metaDescription,
        description,
        const DeepCollectionEquality().hash(_geolocationData),
        const DeepCollectionEquality().hash(_metaData),
        deletedAt,
        createdBy,
        parentId,
        todoId,
        lastTrendUpdate,
        lastUsedAt,
        createdAt,
        updatedAt
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagsModel(id: $id, uuid: $uuid, isActive: $isActive, order: $order, version: $version, followerCount: $followerCount, usageCount: $usageCount, relatedPostsCount: $relatedPostsCount, userInteractionCount: $userInteractionCount, popularityScore: $popularityScore, name: $name, slug: $slug, metaTitle: $metaTitle, color: $color, imageUrl: $imageUrl, tagType: $tagType, contentType: $contentType, descriptionVector: $descriptionVector, metaDescription: $metaDescription, description: $description, geolocationData: $geolocationData, metaData: $metaData, deletedAt: $deletedAt, createdBy: $createdBy, parentId: $parentId, todoId: $todoId, lastTrendUpdate: $lastTrendUpdate, lastUsedAt: $lastUsedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$TagsModelCopyWith<$Res>
    implements $TagsModelCopyWith<$Res> {
  factory _$TagsModelCopyWith(
          _TagsModel value, $Res Function(_TagsModel) _then) =
      __$TagsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      bool? isActive,
      int? order,
      int? version,
      int? followerCount,
      int? usageCount,
      int? relatedPostsCount,
      int? userInteractionCount,
      double? popularityScore,
      String? name,
      String? slug,
      String? metaTitle,
      String? color,
      String? imageUrl,
      String? tagType,
      String? contentType,
      String? descriptionVector,
      String? metaDescription,
      String? description,
      Map<String, dynamic>? geolocationData,
      Map<String, dynamic>? metaData,
      DateTime? deletedAt,
      int? createdBy,
      int? parentId,
      int? todoId,
      DateTime? lastTrendUpdate,
      DateTime? lastUsedAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$TagsModelCopyWithImpl<$Res> implements _$TagsModelCopyWith<$Res> {
  __$TagsModelCopyWithImpl(this._self, this._then);

  final _TagsModel _self;
  final $Res Function(_TagsModel) _then;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? isActive = freezed,
    Object? order = freezed,
    Object? version = freezed,
    Object? followerCount = freezed,
    Object? usageCount = freezed,
    Object? relatedPostsCount = freezed,
    Object? userInteractionCount = freezed,
    Object? popularityScore = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? metaTitle = freezed,
    Object? color = freezed,
    Object? imageUrl = freezed,
    Object? tagType = freezed,
    Object? contentType = freezed,
    Object? descriptionVector = freezed,
    Object? metaDescription = freezed,
    Object? description = freezed,
    Object? geolocationData = freezed,
    Object? metaData = freezed,
    Object? deletedAt = freezed,
    Object? createdBy = freezed,
    Object? parentId = freezed,
    Object? todoId = freezed,
    Object? lastTrendUpdate = freezed,
    Object? lastUsedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_TagsModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      followerCount: freezed == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      usageCount: freezed == usageCount
          ? _self.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedPostsCount: freezed == relatedPostsCount
          ? _self.relatedPostsCount
          : relatedPostsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      userInteractionCount: freezed == userInteractionCount
          ? _self.userInteractionCount
          : userInteractionCount // ignore: cast_nullable_to_non_nullable
              as int?,
      popularityScore: freezed == popularityScore
          ? _self.popularityScore
          : popularityScore // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTitle: freezed == metaTitle
          ? _self.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tagType: freezed == tagType
          ? _self.tagType
          : tagType // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVector: freezed == descriptionVector
          ? _self.descriptionVector
          : descriptionVector // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDescription: freezed == metaDescription
          ? _self.metaDescription
          : metaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      geolocationData: freezed == geolocationData
          ? _self._geolocationData
          : geolocationData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metaData: freezed == metaData
          ? _self._metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastTrendUpdate: freezed == lastTrendUpdate
          ? _self.lastTrendUpdate
          : lastTrendUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsedAt: freezed == lastUsedAt
          ? _self.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
