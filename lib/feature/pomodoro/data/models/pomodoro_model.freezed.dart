// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PomodoroModel {
  String? get uuid;
  String? get title;
  String? get description;
  int? get duration;
  String? get status;
  DateTime? get startTime;
  DateTime? get endTime;
  Map<String, dynamic>? get metadata;
  String? get priority;
  String? get tags;
  bool? get isCompleted;
  bool? get isArchived;
  int? get todoId;
  int? get userId;
  int? get projectId;

  /// Create a copy of PomodoroModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PomodoroModelCopyWith<PomodoroModel> get copyWith =>
      _$PomodoroModelCopyWithImpl<PomodoroModel>(
          this as PomodoroModel, _$identity);

  /// Serializes this PomodoroModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PomodoroModel &&
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
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
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
      const DeepCollectionEquality().hash(metadata),
      priority,
      tags,
      isCompleted,
      isArchived,
      todoId,
      userId,
      projectId);

  @override
  String toString() {
    return 'PomodoroModel(uuid: $uuid, title: $title, description: $description, duration: $duration, status: $status, startTime: $startTime, endTime: $endTime, metadata: $metadata, priority: $priority, tags: $tags, isCompleted: $isCompleted, isArchived: $isArchived, todoId: $todoId, userId: $userId, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class $PomodoroModelCopyWith<$Res> {
  factory $PomodoroModelCopyWith(
          PomodoroModel value, $Res Function(PomodoroModel) _then) =
      _$PomodoroModelCopyWithImpl;
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
class _$PomodoroModelCopyWithImpl<$Res>
    implements $PomodoroModelCopyWith<$Res> {
  _$PomodoroModelCopyWithImpl(this._self, this._then);

  final PomodoroModel _self;
  final $Res Function(PomodoroModel) _then;

  /// Create a copy of PomodoroModel
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
    return _then(_self.copyWith(
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isArchived: freezed == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PomodoroModel extends PomodoroModel {
  const _PomodoroModel(
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
      : _metadata = metadata,
        super._();
  factory _PomodoroModel.fromJson(Map<String, dynamic> json) =>
      _$PomodoroModelFromJson(json);

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

  /// Create a copy of PomodoroModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PomodoroModelCopyWith<_PomodoroModel> get copyWith =>
      __$PomodoroModelCopyWithImpl<_PomodoroModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PomodoroModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PomodoroModel &&
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

  @override
  String toString() {
    return 'PomodoroModel(uuid: $uuid, title: $title, description: $description, duration: $duration, status: $status, startTime: $startTime, endTime: $endTime, metadata: $metadata, priority: $priority, tags: $tags, isCompleted: $isCompleted, isArchived: $isArchived, todoId: $todoId, userId: $userId, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class _$PomodoroModelCopyWith<$Res>
    implements $PomodoroModelCopyWith<$Res> {
  factory _$PomodoroModelCopyWith(
          _PomodoroModel value, $Res Function(_PomodoroModel) _then) =
      __$PomodoroModelCopyWithImpl;
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
class __$PomodoroModelCopyWithImpl<$Res>
    implements _$PomodoroModelCopyWith<$Res> {
  __$PomodoroModelCopyWithImpl(this._self, this._then);

  final _PomodoroModel _self;
  final $Res Function(_PomodoroModel) _then;

  /// Create a copy of PomodoroModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_PomodoroModel(
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isArchived: freezed == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
