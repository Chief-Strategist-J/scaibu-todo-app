// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_category_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectCategory _$ProjectCategoryFromJson(Map<String, dynamic> json) {
  return _ProjectCategory.fromJson(json);
}

/// @nodoc
mixin _$ProjectCategory {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCategoryCopyWith<ProjectCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCategoryCopyWith<$Res> {
  factory $ProjectCategoryCopyWith(
          ProjectCategory value, $Res Function(ProjectCategory) then) =
      _$ProjectCategoryCopyWithImpl<$Res, ProjectCategory>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectCategoryCopyWithImpl<$Res, $Val extends ProjectCategory>
    implements $ProjectCategoryCopyWith<$Res> {
  _$ProjectCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectCategory
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
abstract class _$$ProjectCategoryImplCopyWith<$Res>
    implements $ProjectCategoryCopyWith<$Res> {
  factory _$$ProjectCategoryImplCopyWith(_$ProjectCategoryImpl value,
          $Res Function(_$ProjectCategoryImpl) then) =
      __$$ProjectCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectCategoryImplCopyWithImpl<$Res>
    extends _$ProjectCategoryCopyWithImpl<$Res, _$ProjectCategoryImpl>
    implements _$$ProjectCategoryImplCopyWith<$Res> {
  __$$ProjectCategoryImplCopyWithImpl(
      _$ProjectCategoryImpl _value, $Res Function(_$ProjectCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectCategoryImpl(
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
class _$ProjectCategoryImpl implements _ProjectCategory {
  const _$ProjectCategoryImpl({this.id, this.name});

  factory _$ProjectCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCategoryImplCopyWith<_$ProjectCategoryImpl> get copyWith =>
      __$$ProjectCategoryImplCopyWithImpl<_$ProjectCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCategoryImplToJson(
      this,
    );
  }
}

abstract class _ProjectCategory implements ProjectCategory {
  const factory _ProjectCategory({final int? id, final String? name}) =
      _$ProjectCategoryImpl;

  factory _ProjectCategory.fromJson(Map<String, dynamic> json) =
      _$ProjectCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCategoryImplCopyWith<_$ProjectCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectPhase _$ProjectPhaseFromJson(Map<String, dynamic> json) {
  return _ProjectPhase.fromJson(json);
}

/// @nodoc
mixin _$ProjectPhase {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectPhase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectPhaseCopyWith<ProjectPhase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectPhaseCopyWith<$Res> {
  factory $ProjectPhaseCopyWith(
          ProjectPhase value, $Res Function(ProjectPhase) then) =
      _$ProjectPhaseCopyWithImpl<$Res, ProjectPhase>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPhaseCopyWithImpl<$Res, $Val extends ProjectPhase>
    implements $ProjectPhaseCopyWith<$Res> {
  _$ProjectPhaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectPhase
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
abstract class _$$ProjectPhaseImplCopyWith<$Res>
    implements $ProjectPhaseCopyWith<$Res> {
  factory _$$ProjectPhaseImplCopyWith(
          _$ProjectPhaseImpl value, $Res Function(_$ProjectPhaseImpl) then) =
      __$$ProjectPhaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectPhaseImplCopyWithImpl<$Res>
    extends _$ProjectPhaseCopyWithImpl<$Res, _$ProjectPhaseImpl>
    implements _$$ProjectPhaseImplCopyWith<$Res> {
  __$$ProjectPhaseImplCopyWithImpl(
      _$ProjectPhaseImpl _value, $Res Function(_$ProjectPhaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectPhaseImpl(
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
class _$ProjectPhaseImpl implements _ProjectPhase {
  const _$ProjectPhaseImpl({this.id, this.name});

  factory _$ProjectPhaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectPhaseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectPhase(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectPhaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPhaseImplCopyWith<_$ProjectPhaseImpl> get copyWith =>
      __$$ProjectPhaseImplCopyWithImpl<_$ProjectPhaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectPhaseImplToJson(
      this,
    );
  }
}

abstract class _ProjectPhase implements ProjectPhase {
  const factory _ProjectPhase({final int? id, final String? name}) =
      _$ProjectPhaseImpl;

  factory _ProjectPhase.fromJson(Map<String, dynamic> json) =
      _$ProjectPhaseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectPhaseImplCopyWith<_$ProjectPhaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectPriority _$ProjectPriorityFromJson(Map<String, dynamic> json) {
  return _ProjectPriority.fromJson(json);
}

/// @nodoc
mixin _$ProjectPriority {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectPriority to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectPriorityCopyWith<ProjectPriority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectPriorityCopyWith<$Res> {
  factory $ProjectPriorityCopyWith(
          ProjectPriority value, $Res Function(ProjectPriority) then) =
      _$ProjectPriorityCopyWithImpl<$Res, ProjectPriority>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPriorityCopyWithImpl<$Res, $Val extends ProjectPriority>
    implements $ProjectPriorityCopyWith<$Res> {
  _$ProjectPriorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectPriority
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
abstract class _$$ProjectPriorityImplCopyWith<$Res>
    implements $ProjectPriorityCopyWith<$Res> {
  factory _$$ProjectPriorityImplCopyWith(_$ProjectPriorityImpl value,
          $Res Function(_$ProjectPriorityImpl) then) =
      __$$ProjectPriorityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectPriorityImplCopyWithImpl<$Res>
    extends _$ProjectPriorityCopyWithImpl<$Res, _$ProjectPriorityImpl>
    implements _$$ProjectPriorityImplCopyWith<$Res> {
  __$$ProjectPriorityImplCopyWithImpl(
      _$ProjectPriorityImpl _value, $Res Function(_$ProjectPriorityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectPriorityImpl(
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
class _$ProjectPriorityImpl implements _ProjectPriority {
  const _$ProjectPriorityImpl({this.id, this.name});

  factory _$ProjectPriorityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectPriorityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectPriority(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectPriorityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPriorityImplCopyWith<_$ProjectPriorityImpl> get copyWith =>
      __$$ProjectPriorityImplCopyWithImpl<_$ProjectPriorityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectPriorityImplToJson(
      this,
    );
  }
}

abstract class _ProjectPriority implements ProjectPriority {
  const factory _ProjectPriority({final int? id, final String? name}) =
      _$ProjectPriorityImpl;

  factory _ProjectPriority.fromJson(Map<String, dynamic> json) =
      _$ProjectPriorityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectPriorityImplCopyWith<_$ProjectPriorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectType _$ProjectTypeFromJson(Map<String, dynamic> json) {
  return _ProjectType.fromJson(json);
}

/// @nodoc
mixin _$ProjectType {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectTypeCopyWith<ProjectType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypeCopyWith<$Res> {
  factory $ProjectTypeCopyWith(
          ProjectType value, $Res Function(ProjectType) then) =
      _$ProjectTypeCopyWithImpl<$Res, ProjectType>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectTypeCopyWithImpl<$Res, $Val extends ProjectType>
    implements $ProjectTypeCopyWith<$Res> {
  _$ProjectTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectType
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
abstract class _$$ProjectTypeImplCopyWith<$Res>
    implements $ProjectTypeCopyWith<$Res> {
  factory _$$ProjectTypeImplCopyWith(
          _$ProjectTypeImpl value, $Res Function(_$ProjectTypeImpl) then) =
      __$$ProjectTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectTypeImplCopyWithImpl<$Res>
    extends _$ProjectTypeCopyWithImpl<$Res, _$ProjectTypeImpl>
    implements _$$ProjectTypeImplCopyWith<$Res> {
  __$$ProjectTypeImplCopyWithImpl(
      _$ProjectTypeImpl _value, $Res Function(_$ProjectTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectTypeImpl(
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
class _$ProjectTypeImpl implements _ProjectType {
  const _$ProjectTypeImpl({this.id, this.name});

  factory _$ProjectTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectTypeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectType(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTypeImplCopyWith<_$ProjectTypeImpl> get copyWith =>
      __$$ProjectTypeImplCopyWithImpl<_$ProjectTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTypeImplToJson(
      this,
    );
  }
}

abstract class _ProjectType implements ProjectType {
  const factory _ProjectType({final int? id, final String? name}) =
      _$ProjectTypeImpl;

  factory _ProjectType.fromJson(Map<String, dynamic> json) =
      _$ProjectTypeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectTypeImplCopyWith<_$ProjectTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectStatus _$ProjectStatusFromJson(Map<String, dynamic> json) {
  return _ProjectStatus.fromJson(json);
}

/// @nodoc
mixin _$ProjectStatus {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ProjectStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectStatusCopyWith<ProjectStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStatusCopyWith<$Res> {
  factory $ProjectStatusCopyWith(
          ProjectStatus value, $Res Function(ProjectStatus) then) =
      _$ProjectStatusCopyWithImpl<$Res, ProjectStatus>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectStatusCopyWithImpl<$Res, $Val extends ProjectStatus>
    implements $ProjectStatusCopyWith<$Res> {
  _$ProjectStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectStatus
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
abstract class _$$ProjectStatusImplCopyWith<$Res>
    implements $ProjectStatusCopyWith<$Res> {
  factory _$$ProjectStatusImplCopyWith(
          _$ProjectStatusImpl value, $Res Function(_$ProjectStatusImpl) then) =
      __$$ProjectStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ProjectStatusImplCopyWithImpl<$Res>
    extends _$ProjectStatusCopyWithImpl<$Res, _$ProjectStatusImpl>
    implements _$$ProjectStatusImplCopyWith<$Res> {
  __$$ProjectStatusImplCopyWithImpl(
      _$ProjectStatusImpl _value, $Res Function(_$ProjectStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectStatusImpl(
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
class _$ProjectStatusImpl implements _ProjectStatus {
  const _$ProjectStatusImpl({this.id, this.name});

  factory _$ProjectStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectStatusImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProjectStatus(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStatusImplCopyWith<_$ProjectStatusImpl> get copyWith =>
      __$$ProjectStatusImplCopyWithImpl<_$ProjectStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectStatusImplToJson(
      this,
    );
  }
}

abstract class _ProjectStatus implements ProjectStatus {
  const factory _ProjectStatus({final int? id, final String? name}) =
      _$ProjectStatusImpl;

  factory _ProjectStatus.fromJson(Map<String, dynamic> json) =
      _$ProjectStatusImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStatusImplCopyWith<_$ProjectStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectCategoryData _$ProjectCategoryDataFromJson(Map<String, dynamic> json) {
  return _ProjectCategoryData.fromJson(json);
}

/// @nodoc
mixin _$ProjectCategoryData {
  List<ProjectCategory>? get categories => throw _privateConstructorUsedError;
  List<ProjectPhase>? get phases => throw _privateConstructorUsedError;
  List<ProjectPriority>? get priorities => throw _privateConstructorUsedError;
  List<ProjectType>? get types => throw _privateConstructorUsedError;
  List<ProjectStatus>? get statuses => throw _privateConstructorUsedError;

  /// Serializes this ProjectCategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCategoryDataCopyWith<ProjectCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCategoryDataCopyWith<$Res> {
  factory $ProjectCategoryDataCopyWith(
          ProjectCategoryData value, $Res Function(ProjectCategoryData) then) =
      _$ProjectCategoryDataCopyWithImpl<$Res, ProjectCategoryData>;
  @useResult
  $Res call(
      {List<ProjectCategory>? categories,
      List<ProjectPhase>? phases,
      List<ProjectPriority>? priorities,
      List<ProjectType>? types,
      List<ProjectStatus>? statuses});
}

/// @nodoc
class _$ProjectCategoryDataCopyWithImpl<$Res, $Val extends ProjectCategoryData>
    implements $ProjectCategoryDataCopyWith<$Res> {
  _$ProjectCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectCategoryData
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
              as List<ProjectCategory>?,
      phases: freezed == phases
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhase>?,
      priorities: freezed == priorities
          ? _value.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriority>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>?,
      statuses: freezed == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatus>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectCategoryDataImplCopyWith<$Res>
    implements $ProjectCategoryDataCopyWith<$Res> {
  factory _$$ProjectCategoryDataImplCopyWith(_$ProjectCategoryDataImpl value,
          $Res Function(_$ProjectCategoryDataImpl) then) =
      __$$ProjectCategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProjectCategory>? categories,
      List<ProjectPhase>? phases,
      List<ProjectPriority>? priorities,
      List<ProjectType>? types,
      List<ProjectStatus>? statuses});
}

/// @nodoc
class __$$ProjectCategoryDataImplCopyWithImpl<$Res>
    extends _$ProjectCategoryDataCopyWithImpl<$Res, _$ProjectCategoryDataImpl>
    implements _$$ProjectCategoryDataImplCopyWith<$Res> {
  __$$ProjectCategoryDataImplCopyWithImpl(_$ProjectCategoryDataImpl _value,
      $Res Function(_$ProjectCategoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectCategoryData
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
    return _then(_$ProjectCategoryDataImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategory>?,
      phases: freezed == phases
          ? _value._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhase>?,
      priorities: freezed == priorities
          ? _value._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriority>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>?,
      statuses: freezed == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatus>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectCategoryDataImpl implements _ProjectCategoryData {
  const _$ProjectCategoryDataImpl(
      {final List<ProjectCategory>? categories,
      final List<ProjectPhase>? phases,
      final List<ProjectPriority>? priorities,
      final List<ProjectType>? types,
      final List<ProjectStatus>? statuses})
      : _categories = categories,
        _phases = phases,
        _priorities = priorities,
        _types = types,
        _statuses = statuses;

  factory _$ProjectCategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectCategoryDataImplFromJson(json);

  final List<ProjectCategory>? _categories;
  @override
  List<ProjectCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectPhase>? _phases;
  @override
  List<ProjectPhase>? get phases {
    final value = _phases;
    if (value == null) return null;
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectPriority>? _priorities;
  @override
  List<ProjectPriority>? get priorities {
    final value = _priorities;
    if (value == null) return null;
    if (_priorities is EqualUnmodifiableListView) return _priorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectType>? _types;
  @override
  List<ProjectType>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectStatus>? _statuses;
  @override
  List<ProjectStatus>? get statuses {
    final value = _statuses;
    if (value == null) return null;
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProjectCategoryData(categories: $categories, phases: $phases, priorities: $priorities, types: $types, statuses: $statuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCategoryDataImpl &&
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

  /// Create a copy of ProjectCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCategoryDataImplCopyWith<_$ProjectCategoryDataImpl> get copyWith =>
      __$$ProjectCategoryDataImplCopyWithImpl<_$ProjectCategoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCategoryDataImplToJson(
      this,
    );
  }
}

abstract class _ProjectCategoryData implements ProjectCategoryData {
  const factory _ProjectCategoryData(
      {final List<ProjectCategory>? categories,
      final List<ProjectPhase>? phases,
      final List<ProjectPriority>? priorities,
      final List<ProjectType>? types,
      final List<ProjectStatus>? statuses}) = _$ProjectCategoryDataImpl;

  factory _ProjectCategoryData.fromJson(Map<String, dynamic> json) =
      _$ProjectCategoryDataImpl.fromJson;

  @override
  List<ProjectCategory>? get categories;
  @override
  List<ProjectPhase>? get phases;
  @override
  List<ProjectPriority>? get priorities;
  @override
  List<ProjectType>? get types;
  @override
  List<ProjectStatus>? get statuses;

  /// Create a copy of ProjectCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCategoryDataImplCopyWith<_$ProjectCategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectCategoryDataModel _$ProjectCategoryDataModelFromJson(
    Map<String, dynamic> json) {
  return _ProjectCategoryDataModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectCategoryDataModel {
  String? get message => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  ProjectCategoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this ProjectCategoryDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCategoryDataModelCopyWith<ProjectCategoryDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCategoryDataModelCopyWith<$Res> {
  factory $ProjectCategoryDataModelCopyWith(ProjectCategoryDataModel value,
          $Res Function(ProjectCategoryDataModel) then) =
      _$ProjectCategoryDataModelCopyWithImpl<$Res, ProjectCategoryDataModel>;
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryData? data});

  $ProjectCategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProjectCategoryDataModelCopyWithImpl<$Res,
        $Val extends ProjectCategoryDataModel>
    implements $ProjectCategoryDataModelCopyWith<$Res> {
  _$ProjectCategoryDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectCategoryDataModel
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
              as ProjectCategoryData?,
    ) as $Val);
  }

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProjectCategoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectCategoryDataModelImplCopyWith<$Res>
    implements $ProjectCategoryDataModelCopyWith<$Res> {
  factory _$$ProjectCategoryDataModelImplCopyWith(
          _$ProjectCategoryDataModelImpl value,
          $Res Function(_$ProjectCategoryDataModelImpl) then) =
      __$$ProjectCategoryDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryData? data});

  @override
  $ProjectCategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ProjectCategoryDataModelImplCopyWithImpl<$Res>
    extends _$ProjectCategoryDataModelCopyWithImpl<$Res,
        _$ProjectCategoryDataModelImpl>
    implements _$$ProjectCategoryDataModelImplCopyWith<$Res> {
  __$$ProjectCategoryDataModelImplCopyWithImpl(
      _$ProjectCategoryDataModelImpl _value,
      $Res Function(_$ProjectCategoryDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ProjectCategoryDataModelImpl(
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
              as ProjectCategoryData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectCategoryDataModelImpl implements _ProjectCategoryDataModel {
  const _$ProjectCategoryDataModelImpl({this.message, this.status, this.data});

  factory _$ProjectCategoryDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectCategoryDataModelImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? status;
  @override
  final ProjectCategoryData? data;

  @override
  String toString() {
    return 'ProjectCategoryDataModel(message: $message, status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCategoryDataModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCategoryDataModelImplCopyWith<_$ProjectCategoryDataModelImpl>
      get copyWith => __$$ProjectCategoryDataModelImplCopyWithImpl<
          _$ProjectCategoryDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCategoryDataModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectCategoryDataModel implements ProjectCategoryDataModel {
  const factory _ProjectCategoryDataModel(
      {final String? message,
      final bool? status,
      final ProjectCategoryData? data}) = _$ProjectCategoryDataModelImpl;

  factory _ProjectCategoryDataModel.fromJson(Map<String, dynamic> json) =
      _$ProjectCategoryDataModelImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get status;
  @override
  ProjectCategoryData? get data;

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCategoryDataModelImplCopyWith<_$ProjectCategoryDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
