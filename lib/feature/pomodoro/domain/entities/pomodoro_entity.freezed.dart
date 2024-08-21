// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PomodoroEntity _$PomodoroEntityFromJson(Map<String, dynamic> json) {
  return _PomodoroEntity.fromJson(json);
}

/// @nodoc
mixin _$PomodoroEntity {
  String? get uuid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;
  bool? get isArchived => throw _privateConstructorUsedError;
  int? get todoId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get projectId => throw _privateConstructorUsedError;

  /// Serializes this PomodoroEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PomodoroEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PomodoroEntityCopyWith<PomodoroEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroEntityCopyWith<$Res> {
  factory $PomodoroEntityCopyWith(
          PomodoroEntity value, $Res Function(PomodoroEntity) then) =
      _$PomodoroEntityCopyWithImpl<$Res, PomodoroEntity>;
  @useResult
  $Res call(
      {String? uuid,
      String? title,
      String? description,
      int? duration,
      String? status,
      DateTime? startTime,
      DateTime? endTime,
      Map<String, dynamic>? metadata,
      String? priority,
      String? tags,
      bool? isCompleted,
      bool? isArchived,
      int? todoId,
      int? userId,
      int? projectId});
}

/// @nodoc
class _$PomodoroEntityCopyWithImpl<$Res, $Val extends PomodoroEntity>
    implements $PomodoroEntityCopyWith<$Res> {
  _$PomodoroEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PomodoroEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? metadata = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
    Object? isCompleted = freezed,
    Object? isArchived = freezed,
    Object? todoId = freezed,
    Object? userId = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      todoId: freezed == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PomodoroEntityImplCopyWith<$Res>
    implements $PomodoroEntityCopyWith<$Res> {
  factory _$$PomodoroEntityImplCopyWith(_$PomodoroEntityImpl value,
          $Res Function(_$PomodoroEntityImpl) then) =
      __$$PomodoroEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? title,
      String? description,
      int? duration,
      String? status,
      DateTime? startTime,
      DateTime? endTime,
      Map<String, dynamic>? metadata,
      String? priority,
      String? tags,
      bool? isCompleted,
      bool? isArchived,
      int? todoId,
      int? userId,
      int? projectId});
}

/// @nodoc
class __$$PomodoroEntityImplCopyWithImpl<$Res>
    extends _$PomodoroEntityCopyWithImpl<$Res, _$PomodoroEntityImpl>
    implements _$$PomodoroEntityImplCopyWith<$Res> {
  __$$PomodoroEntityImplCopyWithImpl(
      _$PomodoroEntityImpl _value, $Res Function(_$PomodoroEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PomodoroEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? metadata = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
    Object? isCompleted = freezed,
    Object? isArchived = freezed,
    Object? todoId = freezed,
    Object? userId = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_$PomodoroEntityImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      todoId: freezed == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PomodoroEntityImpl implements _PomodoroEntity {
  const _$PomodoroEntityImpl(
      {this.uuid,
      this.title,
      this.description,
      this.duration,
      this.status,
      this.startTime,
      this.endTime,
      final Map<String, dynamic>? metadata,
      this.priority,
      this.tags,
      this.isCompleted,
      this.isArchived,
      this.todoId,
      this.userId,
      this.projectId})
      : _metadata = metadata;

  factory _$PomodoroEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PomodoroEntityImplFromJson(json);

  @override
  final String? uuid;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? duration;
  @override
  final String? status;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
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
  final String? priority;
  @override
  final String? tags;
  @override
  final bool? isCompleted;
  @override
  final bool? isArchived;
  @override
  final int? todoId;
  @override
  final int? userId;
  @override
  final int? projectId;

  @override
  String toString() {
    return 'PomodoroEntity(uuid: $uuid, title: $title, description: $description, duration: $duration, status: $status, startTime: $startTime, endTime: $endTime, metadata: $metadata, priority: $priority, tags: $tags, isCompleted: $isCompleted, isArchived: $isArchived, todoId: $todoId, userId: $userId, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroEntityImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      description,
      duration,
      status,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(_metadata),
      priority,
      tags,
      isCompleted,
      isArchived,
      todoId,
      userId,
      projectId);

  /// Create a copy of PomodoroEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroEntityImplCopyWith<_$PomodoroEntityImpl> get copyWith =>
      __$$PomodoroEntityImplCopyWithImpl<_$PomodoroEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PomodoroEntityImplToJson(
      this,
    );
  }
}

abstract class _PomodoroEntity implements PomodoroEntity {
  const factory _PomodoroEntity(
      {final String? uuid,
      final String? title,
      final String? description,
      final int? duration,
      final String? status,
      final DateTime? startTime,
      final DateTime? endTime,
      final Map<String, dynamic>? metadata,
      final String? priority,
      final String? tags,
      final bool? isCompleted,
      final bool? isArchived,
      final int? todoId,
      final int? userId,
      final int? projectId}) = _$PomodoroEntityImpl;

  factory _PomodoroEntity.fromJson(Map<String, dynamic> json) =
      _$PomodoroEntityImpl.fromJson;

  @override
  String? get uuid;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get duration;
  @override
  String? get status;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get priority;
  @override
  String? get tags;
  @override
  bool? get isCompleted;
  @override
  bool? get isArchived;
  @override
  int? get todoId;
  @override
  int? get userId;
  @override
  int? get projectId;

  /// Create a copy of PomodoroEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PomodoroEntityImplCopyWith<_$PomodoroEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
