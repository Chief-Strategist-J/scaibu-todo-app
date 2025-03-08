// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_category_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectCategory {
  int? get id;
  String? get name;

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCategoryCopyWith<ProjectCategory> get copyWith =>
      _$ProjectCategoryCopyWithImpl<ProjectCategory>(
          this as ProjectCategory, _$identity);

  /// Serializes this ProjectCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectCategory(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectCategoryCopyWith<$Res> {
  factory $ProjectCategoryCopyWith(
          ProjectCategory value, $Res Function(ProjectCategory) _then) =
      _$ProjectCategoryCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectCategoryCopyWithImpl<$Res>
    implements $ProjectCategoryCopyWith<$Res> {
  _$ProjectCategoryCopyWithImpl(this._self, this._then);

  final ProjectCategory _self;
  final $Res Function(ProjectCategory) _then;

  /// Create a copy of ProjectCategory
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
class _ProjectCategory extends ProjectCategory {
  const _ProjectCategory({this.id, this.name}) : super._();
  factory _ProjectCategory.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCategoryCopyWith<_ProjectCategory> get copyWith =>
      __$ProjectCategoryCopyWithImpl<_ProjectCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectCategory(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCategoryCopyWith<$Res>
    implements $ProjectCategoryCopyWith<$Res> {
  factory _$ProjectCategoryCopyWith(
          _ProjectCategory value, $Res Function(_ProjectCategory) _then) =
      __$ProjectCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectCategoryCopyWithImpl<$Res>
    implements _$ProjectCategoryCopyWith<$Res> {
  __$ProjectCategoryCopyWithImpl(this._self, this._then);

  final _ProjectCategory _self;
  final $Res Function(_ProjectCategory) _then;

  /// Create a copy of ProjectCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectCategory(
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
mixin _$ProjectPhase {
  int? get id;
  String? get name;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectPhaseCopyWith<ProjectPhase> get copyWith =>
      _$ProjectPhaseCopyWithImpl<ProjectPhase>(
          this as ProjectPhase, _$identity);

  /// Serializes this ProjectPhase to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectPhase &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPhase(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectPhaseCopyWith<$Res> {
  factory $ProjectPhaseCopyWith(
          ProjectPhase value, $Res Function(ProjectPhase) _then) =
      _$ProjectPhaseCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPhaseCopyWithImpl<$Res> implements $ProjectPhaseCopyWith<$Res> {
  _$ProjectPhaseCopyWithImpl(this._self, this._then);

  final ProjectPhase _self;
  final $Res Function(ProjectPhase) _then;

  /// Create a copy of ProjectPhase
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
class _ProjectPhase extends ProjectPhase {
  const _ProjectPhase({this.id, this.name}) : super._();
  factory _ProjectPhase.fromJson(Map<String, dynamic> json) =>
      _$ProjectPhaseFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectPhaseCopyWith<_ProjectPhase> get copyWith =>
      __$ProjectPhaseCopyWithImpl<_ProjectPhase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectPhaseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectPhase &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPhase(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectPhaseCopyWith<$Res>
    implements $ProjectPhaseCopyWith<$Res> {
  factory _$ProjectPhaseCopyWith(
          _ProjectPhase value, $Res Function(_ProjectPhase) _then) =
      __$ProjectPhaseCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectPhaseCopyWithImpl<$Res>
    implements _$ProjectPhaseCopyWith<$Res> {
  __$ProjectPhaseCopyWithImpl(this._self, this._then);

  final _ProjectPhase _self;
  final $Res Function(_ProjectPhase) _then;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectPhase(
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
mixin _$ProjectPriority {
  int? get id;
  String? get name;

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectPriorityCopyWith<ProjectPriority> get copyWith =>
      _$ProjectPriorityCopyWithImpl<ProjectPriority>(
          this as ProjectPriority, _$identity);

  /// Serializes this ProjectPriority to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectPriority &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPriority(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectPriorityCopyWith<$Res> {
  factory $ProjectPriorityCopyWith(
          ProjectPriority value, $Res Function(ProjectPriority) _then) =
      _$ProjectPriorityCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectPriorityCopyWithImpl<$Res>
    implements $ProjectPriorityCopyWith<$Res> {
  _$ProjectPriorityCopyWithImpl(this._self, this._then);

  final ProjectPriority _self;
  final $Res Function(ProjectPriority) _then;

  /// Create a copy of ProjectPriority
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
class _ProjectPriority extends ProjectPriority {
  const _ProjectPriority({this.id, this.name}) : super._();
  factory _ProjectPriority.fromJson(Map<String, dynamic> json) =>
      _$ProjectPriorityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectPriorityCopyWith<_ProjectPriority> get copyWith =>
      __$ProjectPriorityCopyWithImpl<_ProjectPriority>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectPriorityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectPriority &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectPriority(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectPriorityCopyWith<$Res>
    implements $ProjectPriorityCopyWith<$Res> {
  factory _$ProjectPriorityCopyWith(
          _ProjectPriority value, $Res Function(_ProjectPriority) _then) =
      __$ProjectPriorityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectPriorityCopyWithImpl<$Res>
    implements _$ProjectPriorityCopyWith<$Res> {
  __$ProjectPriorityCopyWithImpl(this._self, this._then);

  final _ProjectPriority _self;
  final $Res Function(_ProjectPriority) _then;

  /// Create a copy of ProjectPriority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectPriority(
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
mixin _$ProjectType {
  int? get id;
  String? get name;

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectTypeCopyWith<ProjectType> get copyWith =>
      _$ProjectTypeCopyWithImpl<ProjectType>(this as ProjectType, _$identity);

  /// Serializes this ProjectType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectType(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectTypeCopyWith<$Res> {
  factory $ProjectTypeCopyWith(
          ProjectType value, $Res Function(ProjectType) _then) =
      _$ProjectTypeCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectTypeCopyWithImpl<$Res> implements $ProjectTypeCopyWith<$Res> {
  _$ProjectTypeCopyWithImpl(this._self, this._then);

  final ProjectType _self;
  final $Res Function(ProjectType) _then;

  /// Create a copy of ProjectType
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
class _ProjectType extends ProjectType {
  const _ProjectType({this.id, this.name}) : super._();
  factory _ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectTypeCopyWith<_ProjectType> get copyWith =>
      __$ProjectTypeCopyWithImpl<_ProjectType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectType(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectTypeCopyWith<$Res>
    implements $ProjectTypeCopyWith<$Res> {
  factory _$ProjectTypeCopyWith(
          _ProjectType value, $Res Function(_ProjectType) _then) =
      __$ProjectTypeCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectTypeCopyWithImpl<$Res> implements _$ProjectTypeCopyWith<$Res> {
  __$ProjectTypeCopyWithImpl(this._self, this._then);

  final _ProjectType _self;
  final $Res Function(_ProjectType) _then;

  /// Create a copy of ProjectType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectType(
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
mixin _$ProjectStatus {
  int? get id;
  String? get name;

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectStatusCopyWith<ProjectStatus> get copyWith =>
      _$ProjectStatusCopyWithImpl<ProjectStatus>(
          this as ProjectStatus, _$identity);

  /// Serializes this ProjectStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectStatus(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProjectStatusCopyWith<$Res> {
  factory $ProjectStatusCopyWith(
          ProjectStatus value, $Res Function(ProjectStatus) _then) =
      _$ProjectStatusCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProjectStatusCopyWithImpl<$Res>
    implements $ProjectStatusCopyWith<$Res> {
  _$ProjectStatusCopyWithImpl(this._self, this._then);

  final ProjectStatus _self;
  final $Res Function(ProjectStatus) _then;

  /// Create a copy of ProjectStatus
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
class _ProjectStatus extends ProjectStatus {
  const _ProjectStatus({this.id, this.name}) : super._();
  factory _ProjectStatus.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatusFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectStatusCopyWith<_ProjectStatus> get copyWith =>
      __$ProjectStatusCopyWithImpl<_ProjectStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProjectStatus(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProjectStatusCopyWith<$Res>
    implements $ProjectStatusCopyWith<$Res> {
  factory _$ProjectStatusCopyWith(
          _ProjectStatus value, $Res Function(_ProjectStatus) _then) =
      __$ProjectStatusCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProjectStatusCopyWithImpl<$Res>
    implements _$ProjectStatusCopyWith<$Res> {
  __$ProjectStatusCopyWithImpl(this._self, this._then);

  final _ProjectStatus _self;
  final $Res Function(_ProjectStatus) _then;

  /// Create a copy of ProjectStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProjectStatus(
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
mixin _$ProjectCategoryData {
  List<ProjectCategory>? get categories;
  List<ProjectPhase>? get phases;
  List<ProjectPriority>? get priorities;
  List<ProjectType>? get types;
  List<ProjectStatus>? get statuses;

  /// Create a copy of ProjectCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataCopyWith<ProjectCategoryData> get copyWith =>
      _$ProjectCategoryDataCopyWithImpl<ProjectCategoryData>(
          this as ProjectCategoryData, _$identity);

  /// Serializes this ProjectCategoryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectCategoryData &&
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
    return 'ProjectCategoryData(categories: $categories, phases: $phases, priorities: $priorities, types: $types, statuses: $statuses)';
  }
}

/// @nodoc
abstract mixin class $ProjectCategoryDataCopyWith<$Res> {
  factory $ProjectCategoryDataCopyWith(
          ProjectCategoryData value, $Res Function(ProjectCategoryData) _then) =
      _$ProjectCategoryDataCopyWithImpl;
  @useResult
  $Res call(
      {List<ProjectCategory>? categories,
      List<ProjectPhase>? phases,
      List<ProjectPriority>? priorities,
      List<ProjectType>? types,
      List<ProjectStatus>? statuses});
}

/// @nodoc
class _$ProjectCategoryDataCopyWithImpl<$Res>
    implements $ProjectCategoryDataCopyWith<$Res> {
  _$ProjectCategoryDataCopyWithImpl(this._self, this._then);

  final ProjectCategoryData _self;
  final $Res Function(ProjectCategoryData) _then;

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
    return _then(_self.copyWith(
      categories: freezed == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategory>?,
      phases: freezed == phases
          ? _self.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhase>?,
      priorities: freezed == priorities
          ? _self.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriority>?,
      types: freezed == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>?,
      statuses: freezed == statuses
          ? _self.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatus>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectCategoryData implements ProjectCategoryData {
  const _ProjectCategoryData(
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
  factory _ProjectCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataFromJson(json);

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

  /// Create a copy of ProjectCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCategoryDataCopyWith<_ProjectCategoryData> get copyWith =>
      __$ProjectCategoryDataCopyWithImpl<_ProjectCategoryData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectCategoryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectCategoryData &&
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
    return 'ProjectCategoryData(categories: $categories, phases: $phases, priorities: $priorities, types: $types, statuses: $statuses)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCategoryDataCopyWith<$Res>
    implements $ProjectCategoryDataCopyWith<$Res> {
  factory _$ProjectCategoryDataCopyWith(_ProjectCategoryData value,
          $Res Function(_ProjectCategoryData) _then) =
      __$ProjectCategoryDataCopyWithImpl;
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
class __$ProjectCategoryDataCopyWithImpl<$Res>
    implements _$ProjectCategoryDataCopyWith<$Res> {
  __$ProjectCategoryDataCopyWithImpl(this._self, this._then);

  final _ProjectCategoryData _self;
  final $Res Function(_ProjectCategoryData) _then;

  /// Create a copy of ProjectCategoryData
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
    return _then(_ProjectCategoryData(
      categories: freezed == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategory>?,
      phases: freezed == phases
          ? _self._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhase>?,
      priorities: freezed == priorities
          ? _self._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<ProjectPriority>?,
      types: freezed == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>?,
      statuses: freezed == statuses
          ? _self._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatus>?,
    ));
  }
}

/// @nodoc
mixin _$ProjectCategoryDataModel {
  String? get message;
  bool? get status;
  ProjectCategoryData? get data;

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataModelCopyWith<ProjectCategoryDataModel> get copyWith =>
      _$ProjectCategoryDataModelCopyWithImpl<ProjectCategoryDataModel>(
          this as ProjectCategoryDataModel, _$identity);

  /// Serializes this ProjectCategoryDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectCategoryDataModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  @override
  String toString() {
    return 'ProjectCategoryDataModel(message: $message, status: $status, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ProjectCategoryDataModelCopyWith<$Res> {
  factory $ProjectCategoryDataModelCopyWith(ProjectCategoryDataModel value,
          $Res Function(ProjectCategoryDataModel) _then) =
      _$ProjectCategoryDataModelCopyWithImpl;
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryData? data});

  $ProjectCategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProjectCategoryDataModelCopyWithImpl<$Res>
    implements $ProjectCategoryDataModelCopyWith<$Res> {
  _$ProjectCategoryDataModelCopyWithImpl(this._self, this._then);

  final ProjectCategoryDataModel _self;
  final $Res Function(ProjectCategoryDataModel) _then;

  /// Create a copy of ProjectCategoryDataModel
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
              as ProjectCategoryData?,
    ));
  }

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ProjectCategoryDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectCategoryDataModel implements ProjectCategoryDataModel {
  const _ProjectCategoryDataModel({this.message, this.status, this.data});
  factory _ProjectCategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryDataModelFromJson(json);

  @override
  final String? message;
  @override
  final bool? status;
  @override
  final ProjectCategoryData? data;

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCategoryDataModelCopyWith<_ProjectCategoryDataModel> get copyWith =>
      __$ProjectCategoryDataModelCopyWithImpl<_ProjectCategoryDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectCategoryDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectCategoryDataModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, status, data);

  @override
  String toString() {
    return 'ProjectCategoryDataModel(message: $message, status: $status, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCategoryDataModelCopyWith<$Res>
    implements $ProjectCategoryDataModelCopyWith<$Res> {
  factory _$ProjectCategoryDataModelCopyWith(_ProjectCategoryDataModel value,
          $Res Function(_ProjectCategoryDataModel) _then) =
      __$ProjectCategoryDataModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, bool? status, ProjectCategoryData? data});

  @override
  $ProjectCategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$ProjectCategoryDataModelCopyWithImpl<$Res>
    implements _$ProjectCategoryDataModelCopyWith<$Res> {
  __$ProjectCategoryDataModelCopyWithImpl(this._self, this._then);

  final _ProjectCategoryDataModel _self;
  final $Res Function(_ProjectCategoryDataModel) _then;

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_ProjectCategoryDataModel(
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
              as ProjectCategoryData?,
    ));
  }

  /// Create a copy of ProjectCategoryDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCategoryDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ProjectCategoryDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
