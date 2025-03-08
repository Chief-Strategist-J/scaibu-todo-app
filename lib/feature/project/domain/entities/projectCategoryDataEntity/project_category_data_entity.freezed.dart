// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_category_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectCategoryEntity {
  int? get id;
  String? get name;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCategoryEntityCopyWith<ProjectCategoryEntity> get copyWith =>
      _$ProjectCategoryEntityCopyWithImpl<ProjectCategoryEntity>(
          this as ProjectCategoryEntity, _$identity);

  /// Serializes this ProjectCategoryEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectCategoryEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectCategoryEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectCategoryEntityCopyWith<$Res> {
  factory $ProjectCategoryEntityCopyWith(ProjectCategoryEntity value,
          $Res Function(ProjectCategoryEntity) _then) =
      _$ProjectCategoryEntityCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectCategoryEntityCopyWithImpl<$Res>
    implements $ProjectCategoryEntityCopyWith<$Res> {
  _$ProjectCategoryEntityCopyWithImpl(this._self, this._then);

  final ProjectCategoryEntity _self;
  final $Res Function(ProjectCategoryEntity) _then;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectCategoryEntity implements ProjectCategoryEntity {
  const _ProjectCategoryEntity({this.id, this.name});
  factory _ProjectCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCategoryEntityCopyWith<_ProjectCategoryEntity> get copyWith =>
      __$ProjectCategoryEntityCopyWithImpl<_ProjectCategoryEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectCategoryEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectCategoryEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectCategoryEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCategoryEntityCopyWith<$Res>
    implements $ProjectCategoryEntityCopyWith<$Res> {
  factory _$ProjectCategoryEntityCopyWith(_ProjectCategoryEntity value,
          $Res Function(_ProjectCategoryEntity) _then) =
      __$ProjectCategoryEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectCategoryEntityCopyWithImpl<$Res>
    implements _$ProjectCategoryEntityCopyWith<$Res> {
  __$ProjectCategoryEntityCopyWithImpl(this._self, this._then);

  final _ProjectCategoryEntity _self;
  final $Res Function(_ProjectCategoryEntity) _then;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectCategoryEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProjectPhaseEntity {
  int? get id;
  String? get name;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectPhaseEntityCopyWith<ProjectPhaseEntity> get copyWith =>
      _$ProjectPhaseEntityCopyWithImpl<ProjectPhaseEntity>(
          this as ProjectPhaseEntity, _$identity);

  /// Serializes this ProjectPhaseEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectPhaseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPhaseEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectPhaseEntityCopyWith<$Res> {
  factory $ProjectPhaseEntityCopyWith(
          ProjectPhaseEntity value, $Res Function(ProjectPhaseEntity) _then) =
      _$ProjectPhaseEntityCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPhaseEntityCopyWithImpl<$Res>
    implements $ProjectPhaseEntityCopyWith<$Res> {
  _$ProjectPhaseEntityCopyWithImpl(this._self, this._then);

  final ProjectPhaseEntity _self;
  final $Res Function(ProjectPhaseEntity) _then;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectPhaseEntity implements ProjectPhaseEntity {
  const _ProjectPhaseEntity({this.id, this.name});
  factory _ProjectPhaseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectPhaseEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectPhaseEntityCopyWith<_ProjectPhaseEntity> get copyWith =>
      __$ProjectPhaseEntityCopyWithImpl<_ProjectPhaseEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectPhaseEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectPhaseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPhaseEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectPhaseEntityCopyWith<$Res>
    implements $ProjectPhaseEntityCopyWith<$Res> {
  factory _$ProjectPhaseEntityCopyWith(
          _ProjectPhaseEntity value, $Res Function(_ProjectPhaseEntity) _then) =
      __$ProjectPhaseEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectPhaseEntityCopyWithImpl<$Res>
    implements _$ProjectPhaseEntityCopyWith<$Res> {
  __$ProjectPhaseEntityCopyWithImpl(this._self, this._then);

  final _ProjectPhaseEntity _self;
  final $Res Function(_ProjectPhaseEntity) _then;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectPhaseEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProjectPriorityEntity {
  int? get id;
  String? get name;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectPriorityEntityCopyWith<ProjectPriorityEntity> get copyWith =>
      _$ProjectPriorityEntityCopyWithImpl<ProjectPriorityEntity>(
          this as ProjectPriorityEntity, _$identity);

  /// Serializes this ProjectPriorityEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectPriorityEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPriorityEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectPriorityEntityCopyWith<$Res> {
  factory $ProjectPriorityEntityCopyWith(ProjectPriorityEntity value,
          $Res Function(ProjectPriorityEntity) _then) =
      _$ProjectPriorityEntityCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPriorityEntityCopyWithImpl<$Res>
    implements $ProjectPriorityEntityCopyWith<$Res> {
  _$ProjectPriorityEntityCopyWithImpl(this._self, this._then);

  final ProjectPriorityEntity _self;
  final $Res Function(ProjectPriorityEntity) _then;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectPriorityEntity implements ProjectPriorityEntity {
  const _ProjectPriorityEntity({this.id, this.name});
  factory _ProjectPriorityEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectPriorityEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectPriorityEntityCopyWith<_ProjectPriorityEntity> get copyWith =>
      __$ProjectPriorityEntityCopyWithImpl<_ProjectPriorityEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectPriorityEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectPriorityEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPriorityEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectPriorityEntityCopyWith<$Res>
    implements $ProjectPriorityEntityCopyWith<$Res> {
  factory _$ProjectPriorityEntityCopyWith(_ProjectPriorityEntity value,
          $Res Function(_ProjectPriorityEntity) _then) =
      __$ProjectPriorityEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectPriorityEntityCopyWithImpl<$Res>
    implements _$ProjectPriorityEntityCopyWith<$Res> {
  __$ProjectPriorityEntityCopyWithImpl(this._self, this._then);

  final _ProjectPriorityEntity _self;
  final $Res Function(_ProjectPriorityEntity) _then;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectPriorityEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProjectTypeEntity {
  int? get id;
  String? get name;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectTypeEntityCopyWith<ProjectTypeEntity> get copyWith =>
      _$ProjectTypeEntityCopyWithImpl<ProjectTypeEntity>(
          this as ProjectTypeEntity, _$identity);

  /// Serializes this ProjectTypeEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectTypeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectTypeEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectTypeEntityCopyWith<$Res> {
  factory $ProjectTypeEntityCopyWith(
          ProjectTypeEntity value, $Res Function(ProjectTypeEntity) _then) =
      _$ProjectTypeEntityCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectTypeEntityCopyWithImpl<$Res>
    implements $ProjectTypeEntityCopyWith<$Res> {
  _$ProjectTypeEntityCopyWithImpl(this._self, this._then);

  final ProjectTypeEntity _self;
  final $Res Function(ProjectTypeEntity) _then;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectTypeEntity implements ProjectTypeEntity {
  const _ProjectTypeEntity({this.id, this.name});
  factory _ProjectTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectTypeEntityCopyWith<_ProjectTypeEntity> get copyWith =>
      __$ProjectTypeEntityCopyWithImpl<_ProjectTypeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectTypeEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectTypeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectTypeEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectTypeEntityCopyWith<$Res>
    implements $ProjectTypeEntityCopyWith<$Res> {
  factory _$ProjectTypeEntityCopyWith(
          _ProjectTypeEntity value, $Res Function(_ProjectTypeEntity) _then) =
      __$ProjectTypeEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectTypeEntityCopyWithImpl<$Res>
    implements _$ProjectTypeEntityCopyWith<$Res> {
  __$ProjectTypeEntityCopyWithImpl(this._self, this._then);

  final _ProjectTypeEntity _self;
  final $Res Function(_ProjectTypeEntity) _then;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectTypeEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProjectStatusEntity {
  int? get id;
  String? get name;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectStatusEntityCopyWith<ProjectStatusEntity> get copyWith =>
      _$ProjectStatusEntityCopyWithImpl<ProjectStatusEntity>(
          this as ProjectStatusEntity, _$identity);

  /// Serializes this ProjectStatusEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectStatusEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectStatusEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectStatusEntityCopyWith<$Res> {
  factory $ProjectStatusEntityCopyWith(
          ProjectStatusEntity value, $Res Function(ProjectStatusEntity) _then) =
      _$ProjectStatusEntityCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectStatusEntityCopyWithImpl<$Res>
    implements $ProjectStatusEntityCopyWith<$Res> {
  _$ProjectStatusEntityCopyWithImpl(this._self, this._then);

  final ProjectStatusEntity _self;
  final $Res Function(ProjectStatusEntity) _then;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectStatusEntity implements ProjectStatusEntity {
  const _ProjectStatusEntity({this.id, this.name});
  factory _ProjectStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatusEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectStatusEntityCopyWith<_ProjectStatusEntity> get copyWith =>
      __$ProjectStatusEntityCopyWithImpl<_ProjectStatusEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectStatusEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectStatusEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectStatusEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectStatusEntityCopyWith<$Res>
    implements $ProjectStatusEntityCopyWith<$Res> {
  factory _$ProjectStatusEntityCopyWith(_ProjectStatusEntity value,
          $Res Function(_ProjectStatusEntity) _then) =
      __$ProjectStatusEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectStatusEntityCopyWithImpl<$Res>
    implements _$ProjectStatusEntityCopyWith<$Res> {
  __$ProjectStatusEntityCopyWithImpl(this._self, this._then);

  final _ProjectStatusEntity _self;
  final $Res Function(_ProjectStatusEntity) _then;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectStatusEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProjectCategoryDataEntity {
  List<ProjectCategoryEntity>? get categories;
  List<ProjectPhaseEntity>? get phases;
  List<ProjectPriorityEntity>? get priorities;
  List<ProjectTypeEntity>? get types;
  List<ProjectStatusEntity>? get statuses;

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataEntityCopyWith<ProjectCategoryDataEntity> get copyWith =>
      _$ProjectCategoryDataEntityCopyWithImpl<ProjectCategoryDataEntity>(
          this as ProjectCategoryDataEntity, _$identity);

  /// Serializes this ProjectCategoryDataEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectCategoryDataEntity &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.phases, phases) &&
            const DeepCollectionEquality()
                .equals(other.priorities, priorities) &&
            const DeepCollectionEquality().equals(other.types, types) &&
            const DeepCollectionEquality().equals(other.statuses, statuses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(phases),
      const DeepCollectionEquality().hash(priorities),
      const DeepCollectionEquality().hash(types),
      const DeepCollectionEquality().hash(statuses));

  @override
  String toString() {
    return 'ProjectCategoryDataEntity(categories: $categories, phases: $phases, priorities: $priorities, types: $types, statuses: $statuses)';
  }
}

/// @nodoc
abstract mixin class $ProjectCategoryDataEntityCopyWith<$Res> {
  factory $ProjectCategoryDataEntityCopyWith(ProjectCategoryDataEntity value,
          $Res Function(ProjectCategoryDataEntity) _then) =
      _$ProjectCategoryDataEntityCopyWithImpl;
  @useResult
  $Res call(
      {List<ProjectCategoryEntity>? categories,
      List<ProjectPhaseEntity>? phases,
      List<ProjectPriorityEntity>? priorities,
      List<ProjectTypeEntity>? types,
      List<ProjectStatusEntity>? statuses});
}

/// @nodoc
class _$ProjectCategoryDataEntityCopyWithImpl<$Res>
    implements $ProjectCategoryDataEntityCopyWith<$Res> {
  _$ProjectCategoryDataEntityCopyWithImpl(this._self, this._then);

  final ProjectCategoryDataEntity _self;
  final $Res Function(ProjectCategoryDataEntity) _then;

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? phases = freezed,
    Object? priorities = freezed,
    Object? types = freezed,
    Object? statuses = freezed,
  }) {
    return _then(_self.copyWith(
      categories: freezed == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategoryEntity>?,
      phases: freezed == phases
          ? _self.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhaseEntity>?,
      priorities: freezed == priorities
          ? _self.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriorityEntity>?,
      types: freezed == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectTypeEntity>?,
      statuses: freezed == statuses
          ? _self.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatusEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectCategoryDataEntity implements ProjectCategoryDataEntity {
  const _ProjectCategoryDataEntity(
      {final List<ProjectCategoryEntity>? categories,
      final List<ProjectPhaseEntity>? phases,
      final List<ProjectPriorityEntity>? priorities,
      final List<ProjectTypeEntity>? types,
      final List<ProjectStatusEntity>? statuses})
      : _categories = categories,
        _phases = phases,
        _priorities = priorities,
        _types = types,
        _statuses = statuses;
  factory _ProjectCategoryDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataEntityFromJson(json);

  final List<ProjectCategoryEntity>? _categories;
  @override
  List<ProjectCategoryEntity>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectPhaseEntity>? _phases;
  @override
  List<ProjectPhaseEntity>? get phases {
    final value = _phases;
    if (value == null) return null;
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectPriorityEntity>? _priorities;
  @override
  List<ProjectPriorityEntity>? get priorities {
    final value = _priorities;
    if (value == null) return null;
    if (_priorities is EqualUnmodifiableListView) return _priorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectTypeEntity>? _types;
  @override
  List<ProjectTypeEntity>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectStatusEntity>? _statuses;
  @override
  List<ProjectStatusEntity>? get statuses {
    final value = _statuses;
    if (value == null) return null;
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCategoryDataEntityCopyWith<_ProjectCategoryDataEntity>
      get copyWith =>
          __$ProjectCategoryDataEntityCopyWithImpl<_ProjectCategoryDataEntity>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectCategoryDataEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectCategoryDataEntity &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._phases, _phases) &&
            const DeepCollectionEquality()
                .equals(other._priorities, _priorities) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_phases),
      const DeepCollectionEquality().hash(_priorities),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_statuses));

  @override
  String toString() {
    return 'ProjectCategoryDataEntity(categories: $categories, phases: $phases, priorities: $priorities, types: $types, statuses: $statuses)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCategoryDataEntityCopyWith<$Res>
    implements $ProjectCategoryDataEntityCopyWith<$Res> {
  factory _$ProjectCategoryDataEntityCopyWith(_ProjectCategoryDataEntity value,
          $Res Function(_ProjectCategoryDataEntity) _then) =
      __$ProjectCategoryDataEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProjectCategoryEntity>? categories,
      List<ProjectPhaseEntity>? phases,
      List<ProjectPriorityEntity>? priorities,
      List<ProjectTypeEntity>? types,
      List<ProjectStatusEntity>? statuses});
}

/// @nodoc
class __$ProjectCategoryDataEntityCopyWithImpl<$Res>
    implements _$ProjectCategoryDataEntityCopyWith<$Res> {
  __$ProjectCategoryDataEntityCopyWithImpl(this._self, this._then);

  final _ProjectCategoryDataEntity _self;
  final $Res Function(_ProjectCategoryDataEntity) _then;

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = freezed,
    Object? phases = freezed,
    Object? priorities = freezed,
    Object? types = freezed,
    Object? statuses = freezed,
  }) {
    return _then(_ProjectCategoryDataEntity(
      categories: freezed == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategoryEntity>?,
      phases: freezed == phases
          ? _self._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhaseEntity>?,
      priorities: freezed == priorities
          ? _self._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriorityEntity>?,
      types: freezed == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectTypeEntity>?,
      statuses: freezed == statuses
          ? _self._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatusEntity>?,
    ));
  }
}

/// @nodoc
mixin _$ProjectCategoryDataModelEntity {
  String? get message;
  bool? get status;
  ProjectCategoryDataEntity? get data;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataModelEntityCopyWith<ProjectCategoryDataModelEntity>
      get copyWith => _$ProjectCategoryDataModelEntityCopyWithImpl<
              ProjectCategoryDataModelEntity>(
          this as ProjectCategoryDataModelEntity, _$identity);

  /// Serializes this ProjectCategoryDataModelEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectCategoryDataModelEntity &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  @override
  String toString() {
    return 'ProjectCategoryDataModelEntity(message: $message, status: $status, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ProjectCategoryDataModelEntityCopyWith<$Res> {
  factory $ProjectCategoryDataModelEntityCopyWith(
          ProjectCategoryDataModelEntity value,
          $Res Function(ProjectCategoryDataModelEntity) _then) =
      _$ProjectCategoryDataModelEntityCopyWithImpl;
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryDataEntity? data});

  $ProjectCategoryDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProjectCategoryDataModelEntityCopyWithImpl<$Res>
    implements $ProjectCategoryDataModelEntityCopyWith<$Res> {
  _$ProjectCategoryDataModelEntityCopyWithImpl(this._self, this._then);

  final ProjectCategoryDataModelEntity _self;
  final $Res Function(ProjectCategoryDataModelEntity) _then;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProjectCategoryDataEntity?,
    ));
  }

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ProjectCategoryDataEntityCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectCategoryDataModelEntity
    implements ProjectCategoryDataModelEntity {
  const _ProjectCategoryDataModelEntity({this.message, this.status, this.data});
  factory _ProjectCategoryDataModelEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelEntityFromJson(json);

  @override
  final String? message;
  @override
  final bool? status;
  @override
  final ProjectCategoryDataEntity? data;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCategoryDataModelEntityCopyWith<_ProjectCategoryDataModelEntity>
      get copyWith => __$ProjectCategoryDataModelEntityCopyWithImpl<
          _ProjectCategoryDataModelEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectCategoryDataModelEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectCategoryDataModelEntity &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  @override
  String toString() {
    return 'ProjectCategoryDataModelEntity(message: $message, status: $status, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCategoryDataModelEntityCopyWith<$Res>
    implements $ProjectCategoryDataModelEntityCopyWith<$Res> {
  factory _$ProjectCategoryDataModelEntityCopyWith(
          _ProjectCategoryDataModelEntity value,
          $Res Function(_ProjectCategoryDataModelEntity) _then) =
      __$ProjectCategoryDataModelEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryDataEntity? data});

  @override
  $ProjectCategoryDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class __$ProjectCategoryDataModelEntityCopyWithImpl<$Res>
    implements _$ProjectCategoryDataModelEntityCopyWith<$Res> {
  __$ProjectCategoryDataModelEntityCopyWithImpl(this._self, this._then);

  final _ProjectCategoryDataModelEntity _self;
  final $Res Function(_ProjectCategoryDataModelEntity) _then;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_ProjectCategoryDataModelEntity(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProjectCategoryDataEntity?,
    ));
  }

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ProjectCategoryDataEntityCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
