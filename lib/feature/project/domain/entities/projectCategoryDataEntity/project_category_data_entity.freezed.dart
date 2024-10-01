// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_category_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectCategoryEntity _$ProjectCategoryEntityFromJson(
    Map<String, dynamic> json) {
  return _ProjectCategoryEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectCategoryEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectCategoryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCategoryEntityCopyWith<ProjectCategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCategoryEntityCopyWith<$Res> {
  factory $ProjectCategoryEntityCopyWith(ProjectCategoryEntity value,
          $Res Function(ProjectCategoryEntity) then) =
      _$ProjectCategoryEntityCopyWithImpl<$Res, ProjectCategoryEntity>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectCategoryEntityCopyWithImpl<$Res,
        $Val extends ProjectCategoryEntity>
    implements $ProjectCategoryEntityCopyWith<$Res> {
  _$ProjectCategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectCategoryEntityImplCopyWith<$Res>
    implements $ProjectCategoryEntityCopyWith<$Res> {
  factory _$$ProjectCategoryEntityImplCopyWith(
          _$ProjectCategoryEntityImpl value,
          $Res Function(_$ProjectCategoryEntityImpl) then) =
      __$$ProjectCategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectCategoryEntityImplCopyWithImpl<$Res>
    extends _$ProjectCategoryEntityCopyWithImpl<$Res,
        _$ProjectCategoryEntityImpl>
    implements _$$ProjectCategoryEntityImplCopyWith<$Res> {
  __$$ProjectCategoryEntityImplCopyWithImpl(_$ProjectCategoryEntityImpl _value,
      $Res Function(_$ProjectCategoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectCategoryEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectCategoryEntityImpl implements _ProjectCategoryEntity {
  const _$ProjectCategoryEntityImpl({this.id, this.name});

  factory _$ProjectCategoryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectCategoryEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectCategoryEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCategoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCategoryEntityImplCopyWith<_$ProjectCategoryEntityImpl>
      get copyWith => __$$ProjectCategoryEntityImplCopyWithImpl<
          _$ProjectCategoryEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCategoryEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectCategoryEntity implements ProjectCategoryEntity {
  const factory _ProjectCategoryEntity({final int? id, final String? name}) =
      _$ProjectCategoryEntityImpl;

  factory _ProjectCategoryEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectCategoryEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectCategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCategoryEntityImplCopyWith<_$ProjectCategoryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectPhaseEntity _$ProjectPhaseEntityFromJson(Map<String, dynamic> json) {
  return _ProjectPhaseEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectPhaseEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectPhaseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectPhaseEntityCopyWith<ProjectPhaseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectPhaseEntityCopyWith<$Res> {
  factory $ProjectPhaseEntityCopyWith(
          ProjectPhaseEntity value, $Res Function(ProjectPhaseEntity) then) =
      _$ProjectPhaseEntityCopyWithImpl<$Res, ProjectPhaseEntity>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPhaseEntityCopyWithImpl<$Res, $Val extends ProjectPhaseEntity>
    implements $ProjectPhaseEntityCopyWith<$Res> {
  _$ProjectPhaseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectPhaseEntityImplCopyWith<$Res>
    implements $ProjectPhaseEntityCopyWith<$Res> {
  factory _$$ProjectPhaseEntityImplCopyWith(_$ProjectPhaseEntityImpl value,
          $Res Function(_$ProjectPhaseEntityImpl) then) =
      __$$ProjectPhaseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectPhaseEntityImplCopyWithImpl<$Res>
    extends _$ProjectPhaseEntityCopyWithImpl<$Res, _$ProjectPhaseEntityImpl>
    implements _$$ProjectPhaseEntityImplCopyWith<$Res> {
  __$$ProjectPhaseEntityImplCopyWithImpl(_$ProjectPhaseEntityImpl _value,
      $Res Function(_$ProjectPhaseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectPhaseEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectPhaseEntityImpl implements _ProjectPhaseEntity {
  const _$ProjectPhaseEntityImpl({this.id, this.name});

  factory _$ProjectPhaseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectPhaseEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectPhaseEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectPhaseEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPhaseEntityImplCopyWith<_$ProjectPhaseEntityImpl> get copyWith =>
      __$$ProjectPhaseEntityImplCopyWithImpl<_$ProjectPhaseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectPhaseEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectPhaseEntity implements ProjectPhaseEntity {
  const factory _ProjectPhaseEntity({final int? id, final String? name}) =
      _$ProjectPhaseEntityImpl;

  factory _ProjectPhaseEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectPhaseEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectPhaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectPhaseEntityImplCopyWith<_$ProjectPhaseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectPriorityEntity _$ProjectPriorityEntityFromJson(
    Map<String, dynamic> json) {
  return _ProjectPriorityEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectPriorityEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectPriorityEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectPriorityEntityCopyWith<ProjectPriorityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectPriorityEntityCopyWith<$Res> {
  factory $ProjectPriorityEntityCopyWith(ProjectPriorityEntity value,
          $Res Function(ProjectPriorityEntity) then) =
      _$ProjectPriorityEntityCopyWithImpl<$Res, ProjectPriorityEntity>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPriorityEntityCopyWithImpl<$Res,
        $Val extends ProjectPriorityEntity>
    implements $ProjectPriorityEntityCopyWith<$Res> {
  _$ProjectPriorityEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectPriorityEntityImplCopyWith<$Res>
    implements $ProjectPriorityEntityCopyWith<$Res> {
  factory _$$ProjectPriorityEntityImplCopyWith(
          _$ProjectPriorityEntityImpl value,
          $Res Function(_$ProjectPriorityEntityImpl) then) =
      __$$ProjectPriorityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectPriorityEntityImplCopyWithImpl<$Res>
    extends _$ProjectPriorityEntityCopyWithImpl<$Res,
        _$ProjectPriorityEntityImpl>
    implements _$$ProjectPriorityEntityImplCopyWith<$Res> {
  __$$ProjectPriorityEntityImplCopyWithImpl(_$ProjectPriorityEntityImpl _value,
      $Res Function(_$ProjectPriorityEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectPriorityEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectPriorityEntityImpl implements _ProjectPriorityEntity {
  const _$ProjectPriorityEntityImpl({this.id, this.name});

  factory _$ProjectPriorityEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectPriorityEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectPriorityEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectPriorityEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPriorityEntityImplCopyWith<_$ProjectPriorityEntityImpl>
      get copyWith => __$$ProjectPriorityEntityImplCopyWithImpl<
          _$ProjectPriorityEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectPriorityEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectPriorityEntity implements ProjectPriorityEntity {
  const factory _ProjectPriorityEntity({final int? id, final String? name}) =
      _$ProjectPriorityEntityImpl;

  factory _ProjectPriorityEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectPriorityEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectPriorityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectPriorityEntityImplCopyWith<_$ProjectPriorityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectTypeEntity _$ProjectTypeEntityFromJson(Map<String, dynamic> json) {
  return _ProjectTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectTypeEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectTypeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectTypeEntityCopyWith<ProjectTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypeEntityCopyWith<$Res> {
  factory $ProjectTypeEntityCopyWith(
          ProjectTypeEntity value, $Res Function(ProjectTypeEntity) then) =
      _$ProjectTypeEntityCopyWithImpl<$Res, ProjectTypeEntity>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectTypeEntityCopyWithImpl<$Res, $Val extends ProjectTypeEntity>
    implements $ProjectTypeEntityCopyWith<$Res> {
  _$ProjectTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectTypeEntityImplCopyWith<$Res>
    implements $ProjectTypeEntityCopyWith<$Res> {
  factory _$$ProjectTypeEntityImplCopyWith(_$ProjectTypeEntityImpl value,
          $Res Function(_$ProjectTypeEntityImpl) then) =
      __$$ProjectTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectTypeEntityImplCopyWithImpl<$Res>
    extends _$ProjectTypeEntityCopyWithImpl<$Res, _$ProjectTypeEntityImpl>
    implements _$$ProjectTypeEntityImplCopyWith<$Res> {
  __$$ProjectTypeEntityImplCopyWithImpl(_$ProjectTypeEntityImpl _value,
      $Res Function(_$ProjectTypeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectTypeEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectTypeEntityImpl implements _ProjectTypeEntity {
  const _$ProjectTypeEntityImpl({this.id, this.name});

  factory _$ProjectTypeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectTypeEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectTypeEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTypeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTypeEntityImplCopyWith<_$ProjectTypeEntityImpl> get copyWith =>
      __$$ProjectTypeEntityImplCopyWithImpl<_$ProjectTypeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTypeEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectTypeEntity implements ProjectTypeEntity {
  const factory _ProjectTypeEntity({final int? id, final String? name}) =
      _$ProjectTypeEntityImpl;

  factory _ProjectTypeEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectTypeEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectTypeEntityImplCopyWith<_$ProjectTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectStatusEntity _$ProjectStatusEntityFromJson(Map<String, dynamic> json) {
  return _ProjectStatusEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectStatusEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectStatusEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectStatusEntityCopyWith<ProjectStatusEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStatusEntityCopyWith<$Res> {
  factory $ProjectStatusEntityCopyWith(
          ProjectStatusEntity value, $Res Function(ProjectStatusEntity) then) =
      _$ProjectStatusEntityCopyWithImpl<$Res, ProjectStatusEntity>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectStatusEntityCopyWithImpl<$Res, $Val extends ProjectStatusEntity>
    implements $ProjectStatusEntityCopyWith<$Res> {
  _$ProjectStatusEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectStatusEntityImplCopyWith<$Res>
    implements $ProjectStatusEntityCopyWith<$Res> {
  factory _$$ProjectStatusEntityImplCopyWith(_$ProjectStatusEntityImpl value,
          $Res Function(_$ProjectStatusEntityImpl) then) =
      __$$ProjectStatusEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectStatusEntityImplCopyWithImpl<$Res>
    extends _$ProjectStatusEntityCopyWithImpl<$Res, _$ProjectStatusEntityImpl>
    implements _$$ProjectStatusEntityImplCopyWith<$Res> {
  __$$ProjectStatusEntityImplCopyWithImpl(_$ProjectStatusEntityImpl _value,
      $Res Function(_$ProjectStatusEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectStatusEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectStatusEntityImpl implements _ProjectStatusEntity {
  const _$ProjectStatusEntityImpl({this.id, this.name});

  factory _$ProjectStatusEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectStatusEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectStatusEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStatusEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStatusEntityImplCopyWith<_$ProjectStatusEntityImpl> get copyWith =>
      __$$ProjectStatusEntityImplCopyWithImpl<_$ProjectStatusEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectStatusEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectStatusEntity implements ProjectStatusEntity {
  const factory _ProjectStatusEntity({final int? id, final String? name}) =
      _$ProjectStatusEntityImpl;

  factory _ProjectStatusEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectStatusEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStatusEntityImplCopyWith<_$ProjectStatusEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectCategoryDataEntity _$ProjectCategoryDataEntityFromJson(
    Map<String, dynamic> json) {
  return _ProjectCategoryDataEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectCategoryDataEntity {
  List<ProjectCategoryEntity>? get categories =>
      throw _privateConstructorUsedError;
  List<ProjectPhaseEntity>? get phases => throw _privateConstructorUsedError;
  List<ProjectPriorityEntity>? get priorities =>
      throw _privateConstructorUsedError;
  List<ProjectTypeEntity>? get types => throw _privateConstructorUsedError;
  List<ProjectStatusEntity>? get statuses => throw _privateConstructorUsedError;

  /// Serializes this ProjectCategoryDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCategoryDataEntityCopyWith<ProjectCategoryDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCategoryDataEntityCopyWith<$Res> {
  factory $ProjectCategoryDataEntityCopyWith(ProjectCategoryDataEntity value,
          $Res Function(ProjectCategoryDataEntity) then) =
      _$ProjectCategoryDataEntityCopyWithImpl<$Res, ProjectCategoryDataEntity>;
  @useResult
  $Res call(
      {List<ProjectCategoryEntity>? categories,
      List<ProjectPhaseEntity>? phases,
      List<ProjectPriorityEntity>? priorities,
      List<ProjectTypeEntity>? types,
      List<ProjectStatusEntity>? statuses});
}

/// @nodoc
class _$ProjectCategoryDataEntityCopyWithImpl<$Res,
        $Val extends ProjectCategoryDataEntity>
    implements $ProjectCategoryDataEntityCopyWith<$Res> {
  _$ProjectCategoryDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategoryEntity>?,
      phases: freezed == phases
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhaseEntity>?,
      priorities: freezed == priorities
          ? _value.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriorityEntity>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectTypeEntity>?,
      statuses: freezed == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatusEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectCategoryDataEntityImplCopyWith<$Res>
    implements $ProjectCategoryDataEntityCopyWith<$Res> {
  factory _$$ProjectCategoryDataEntityImplCopyWith(
          _$ProjectCategoryDataEntityImpl value,
          $Res Function(_$ProjectCategoryDataEntityImpl) then) =
      __$$ProjectCategoryDataEntityImplCopyWithImpl<$Res>;
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
class __$$ProjectCategoryDataEntityImplCopyWithImpl<$Res>
    extends _$ProjectCategoryDataEntityCopyWithImpl<$Res,
        _$ProjectCategoryDataEntityImpl>
    implements _$$ProjectCategoryDataEntityImplCopyWith<$Res> {
  __$$ProjectCategoryDataEntityImplCopyWithImpl(
      _$ProjectCategoryDataEntityImpl _value,
      $Res Function(_$ProjectCategoryDataEntityImpl) _then)
      : super(_value, _then);

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
    return _then(_$ProjectCategoryDataEntityImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategoryEntity>?,
      phases: freezed == phases
          ? _value._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhaseEntity>?,
      priorities: freezed == priorities
          ? _value._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriorityEntity>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectTypeEntity>?,
      statuses: freezed == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatusEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectCategoryDataEntityImpl implements _ProjectCategoryDataEntity {
  const _$ProjectCategoryDataEntityImpl(
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

  factory _$ProjectCategoryDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectCategoryDataEntityImplFromJson(json);

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

  @override
  String toString() {
    return 'ProjectCategoryDataEntity(categories: $categories, phases: $phases, priorities: $priorities, types: $types, statuses: $statuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCategoryDataEntityImpl &&
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

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCategoryDataEntityImplCopyWith<_$ProjectCategoryDataEntityImpl>
      get copyWith => __$$ProjectCategoryDataEntityImplCopyWithImpl<
          _$ProjectCategoryDataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCategoryDataEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectCategoryDataEntity implements ProjectCategoryDataEntity {
  const factory _ProjectCategoryDataEntity(
          {final List<ProjectCategoryEntity>? categories,
          final List<ProjectPhaseEntity>? phases,
          final List<ProjectPriorityEntity>? priorities,
          final List<ProjectTypeEntity>? types,
          final List<ProjectStatusEntity>? statuses}) =
      _$ProjectCategoryDataEntityImpl;

  factory _ProjectCategoryDataEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectCategoryDataEntityImpl.fromJson;

  @override
  List<ProjectCategoryEntity>? get categories;
  @override
  List<ProjectPhaseEntity>? get phases;
  @override
  List<ProjectPriorityEntity>? get priorities;
  @override
  List<ProjectTypeEntity>? get types;
  @override
  List<ProjectStatusEntity>? get statuses;

  /// Create a copy of ProjectCategoryDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCategoryDataEntityImplCopyWith<_$ProjectCategoryDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectCategoryDataModelEntity _$ProjectCategoryDataModelEntityFromJson(
    Map<String, dynamic> json) {
  return _ProjectCategoryDataModelEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectCategoryDataModelEntity {
  String? get message => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  ProjectCategoryDataEntity? get data => throw _privateConstructorUsedError;

  /// Serializes this ProjectCategoryDataModelEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCategoryDataModelEntityCopyWith<ProjectCategoryDataModelEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCategoryDataModelEntityCopyWith<$Res> {
  factory $ProjectCategoryDataModelEntityCopyWith(
          ProjectCategoryDataModelEntity value,
          $Res Function(ProjectCategoryDataModelEntity) then) =
      _$ProjectCategoryDataModelEntityCopyWithImpl<$Res,
          ProjectCategoryDataModelEntity>;
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryDataEntity? data});

  $ProjectCategoryDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProjectCategoryDataModelEntityCopyWithImpl<$Res,
        $Val extends ProjectCategoryDataModelEntity>
    implements $ProjectCategoryDataModelEntityCopyWith<$Res> {
  _$ProjectCategoryDataModelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProjectCategoryDataEntity?,
    ) as $Val);
  }

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataEntityCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProjectCategoryDataEntityCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectCategoryDataModelEntityImplCopyWith<$Res>
    implements $ProjectCategoryDataModelEntityCopyWith<$Res> {
  factory _$$ProjectCategoryDataModelEntityImplCopyWith(
          _$ProjectCategoryDataModelEntityImpl value,
          $Res Function(_$ProjectCategoryDataModelEntityImpl) then) =
      __$$ProjectCategoryDataModelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryDataEntity? data});

  @override
  $ProjectCategoryDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ProjectCategoryDataModelEntityImplCopyWithImpl<$Res>
    extends _$ProjectCategoryDataModelEntityCopyWithImpl<$Res,
        _$ProjectCategoryDataModelEntityImpl>
    implements _$$ProjectCategoryDataModelEntityImplCopyWith<$Res> {
  __$$ProjectCategoryDataModelEntityImplCopyWithImpl(
      _$ProjectCategoryDataModelEntityImpl _value,
      $Res Function(_$ProjectCategoryDataModelEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ProjectCategoryDataModelEntityImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProjectCategoryDataEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectCategoryDataModelEntityImpl
    implements _ProjectCategoryDataModelEntity {
  const _$ProjectCategoryDataModelEntityImpl(
      {this.message, this.status, this.data});

  factory _$ProjectCategoryDataModelEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProjectCategoryDataModelEntityImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? status;
  @override
  final ProjectCategoryDataEntity? data;

  @override
  String toString() {
    return 'ProjectCategoryDataModelEntity(message: $message, status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCategoryDataModelEntityImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCategoryDataModelEntityImplCopyWith<
          _$ProjectCategoryDataModelEntityImpl>
      get copyWith => __$$ProjectCategoryDataModelEntityImplCopyWithImpl<
          _$ProjectCategoryDataModelEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCategoryDataModelEntityImplToJson(
      this,
    );
  }
}

abstract class _ProjectCategoryDataModelEntity
    implements ProjectCategoryDataModelEntity {
  const factory _ProjectCategoryDataModelEntity(
          {final String? message,
          final bool? status,
          final ProjectCategoryDataEntity? data}) =
      _$ProjectCategoryDataModelEntityImpl;

  factory _ProjectCategoryDataModelEntity.fromJson(Map<String, dynamic> json) =
      _$ProjectCategoryDataModelEntityImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get status;
  @override
  ProjectCategoryDataEntity? get data;

  /// Create a copy of ProjectCategoryDataModelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCategoryDataModelEntityImplCopyWith<
          _$ProjectCategoryDataModelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
