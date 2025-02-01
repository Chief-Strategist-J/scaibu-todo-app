// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) {
  return _TodoEntity.fromJson(json);
}

/// @nodoc
mixin _$TodoEntity {
  int? get todoId => throw _privateConstructorUsedError;
  String? get firebaseTodoId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  String? get priority =>
      throw _privateConstructorUsedError; // e.g., low, medium, high
  int? get assignedTo => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  int? get createdBy => throw _privateConstructorUsedError;
  int? get updatedBy => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // e.g., pending, in progress, completed
  DateTime? get reminder => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get estimatedTime => throw _privateConstructorUsedError;
  int? get actualTime => throw _privateConstructorUsedError;
  bool? get recurring => throw _privateConstructorUsedError;
  String? get recurringFrequency =>
      throw _privateConstructorUsedError; // e.g., daily, weekly, monthly
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get colorCode => throw _privateConstructorUsedError;
  bool? get isArchived => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  List<String>? get tagNames => throw _privateConstructorUsedError;

  /// Serializes this TodoEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoEntityCopyWith<TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEntityCopyWith<$Res> {
  factory $TodoEntityCopyWith(
          TodoEntity value, $Res Function(TodoEntity) then) =
      _$TodoEntityCopyWithImpl<$Res, TodoEntity>;
  @useResult
  $Res call(
      {int? todoId,
      String? firebaseTodoId,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? dueDate,
      String? priority,
      int? assignedTo,
      String? tags,
      int? createdBy,
      int? updatedBy,
      String? status,
      DateTime? reminder,
      String? attachment,
      String? category,
      int? estimatedTime,
      int? actualTime,
      bool? recurring,
      String? recurringFrequency,
      String? notes,
      DateTime? completedAt,
      String? colorCode,
      bool? isArchived,
      DateTime? startTime,
      DateTime? endTime,
      DateTime? date,
      List<String>? tagNames});
}

/// @nodoc
class _$TodoEntityCopyWithImpl<$Res, $Val extends TodoEntity>
    implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = freezed,
    Object? firebaseTodoId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? assignedTo = freezed,
    Object? tags = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? status = freezed,
    Object? reminder = freezed,
    Object? attachment = freezed,
    Object? category = freezed,
    Object? estimatedTime = freezed,
    Object? actualTime = freezed,
    Object? recurring = freezed,
    Object? recurringFrequency = freezed,
    Object? notes = freezed,
    Object? completedAt = freezed,
    Object? colorCode = freezed,
    Object? isArchived = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? date = freezed,
    Object? tagNames = freezed,
  }) {
    return _then(_value.copyWith(
      todoId: freezed == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      firebaseTodoId: freezed == firebaseTodoId
          ? _value.firebaseTodoId
          : firebaseTodoId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reminder: freezed == reminder
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      actualTime: freezed == actualTime
          ? _value.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as int?,
      recurring: freezed == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      recurringFrequency: freezed == recurringFrequency
          ? _value.recurringFrequency
          : recurringFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagNames: freezed == tagNames
          ? _value.tagNames
          : tagNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoEntityImplCopyWith<$Res>
    implements $TodoEntityCopyWith<$Res> {
  factory _$$TodoEntityImplCopyWith(
          _$TodoEntityImpl value, $Res Function(_$TodoEntityImpl) then) =
      __$$TodoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? todoId,
      String? firebaseTodoId,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? dueDate,
      String? priority,
      int? assignedTo,
      String? tags,
      int? createdBy,
      int? updatedBy,
      String? status,
      DateTime? reminder,
      String? attachment,
      String? category,
      int? estimatedTime,
      int? actualTime,
      bool? recurring,
      String? recurringFrequency,
      String? notes,
      DateTime? completedAt,
      String? colorCode,
      bool? isArchived,
      DateTime? startTime,
      DateTime? endTime,
      DateTime? date,
      List<String>? tagNames});
}

/// @nodoc
class __$$TodoEntityImplCopyWithImpl<$Res>
    extends _$TodoEntityCopyWithImpl<$Res, _$TodoEntityImpl>
    implements _$$TodoEntityImplCopyWith<$Res> {
  __$$TodoEntityImplCopyWithImpl(
      _$TodoEntityImpl _value, $Res Function(_$TodoEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = freezed,
    Object? firebaseTodoId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? assignedTo = freezed,
    Object? tags = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? status = freezed,
    Object? reminder = freezed,
    Object? attachment = freezed,
    Object? category = freezed,
    Object? estimatedTime = freezed,
    Object? actualTime = freezed,
    Object? recurring = freezed,
    Object? recurringFrequency = freezed,
    Object? notes = freezed,
    Object? completedAt = freezed,
    Object? colorCode = freezed,
    Object? isArchived = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? date = freezed,
    Object? tagNames = freezed,
  }) {
    return _then(_$TodoEntityImpl(
      todoId: freezed == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      firebaseTodoId: freezed == firebaseTodoId
          ? _value.firebaseTodoId
          : firebaseTodoId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reminder: freezed == reminder
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      actualTime: freezed == actualTime
          ? _value.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as int?,
      recurring: freezed == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      recurringFrequency: freezed == recurringFrequency
          ? _value.recurringFrequency
          : recurringFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagNames: freezed == tagNames
          ? _value._tagNames
          : tagNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoEntityImpl implements _TodoEntity {
  const _$TodoEntityImpl(
      {this.todoId,
      this.firebaseTodoId,
      this.title,
      this.description,
      this.isCompleted,
      this.dueDate,
      this.priority,
      this.assignedTo,
      this.tags,
      this.createdBy,
      this.updatedBy,
      this.status,
      this.reminder,
      this.attachment,
      this.category,
      this.estimatedTime,
      this.actualTime,
      this.recurring,
      this.recurringFrequency,
      this.notes,
      this.completedAt,
      this.colorCode,
      this.isArchived,
      this.startTime,
      this.endTime,
      this.date,
      final List<String>? tagNames})
      : _tagNames = tagNames;

  factory _$TodoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoEntityImplFromJson(json);

  @override
  final int? todoId;
  @override
  final String? firebaseTodoId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? isCompleted;
  @override
  final DateTime? dueDate;
  @override
  final String? priority;
// e.g., low, medium, high
  @override
  final int? assignedTo;
  @override
  final String? tags;
  @override
  final int? createdBy;
  @override
  final int? updatedBy;
  @override
  final String? status;
// e.g., pending, in progress, completed
  @override
  final DateTime? reminder;
  @override
  final String? attachment;
  @override
  final String? category;
  @override
  final int? estimatedTime;
  @override
  final int? actualTime;
  @override
  final bool? recurring;
  @override
  final String? recurringFrequency;
// e.g., daily, weekly, monthly
  @override
  final String? notes;
  @override
  final DateTime? completedAt;
  @override
  final String? colorCode;
  @override
  final bool? isArchived;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final DateTime? date;
  final List<String>? _tagNames;
  @override
  List<String>? get tagNames {
    final value = _tagNames;
    if (value == null) return null;
    if (_tagNames is EqualUnmodifiableListView) return _tagNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TodoEntity(todoId: $todoId, firebaseTodoId: $firebaseTodoId, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, assignedTo: $assignedTo, tags: $tags, createdBy: $createdBy, updatedBy: $updatedBy, status: $status, reminder: $reminder, attachment: $attachment, category: $category, estimatedTime: $estimatedTime, actualTime: $actualTime, recurring: $recurring, recurringFrequency: $recurringFrequency, notes: $notes, completedAt: $completedAt, colorCode: $colorCode, isArchived: $isArchived, startTime: $startTime, endTime: $endTime, date: $date, tagNames: $tagNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoEntityImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.firebaseTodoId, firebaseTodoId) ||
                other.firebaseTodoId == firebaseTodoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.actualTime, actualTime) ||
                other.actualTime == actualTime) &&
            (identical(other.recurring, recurring) ||
                other.recurring == recurring) &&
            (identical(other.recurringFrequency, recurringFrequency) ||
                other.recurringFrequency == recurringFrequency) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tagNames, _tagNames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        todoId,
        firebaseTodoId,
        title,
        description,
        isCompleted,
        dueDate,
        priority,
        assignedTo,
        tags,
        createdBy,
        updatedBy,
        status,
        reminder,
        attachment,
        category,
        estimatedTime,
        actualTime,
        recurring,
        recurringFrequency,
        notes,
        completedAt,
        colorCode,
        isArchived,
        startTime,
        endTime,
        date,
        const DeepCollectionEquality().hash(_tagNames)
      ]);

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoEntityImplCopyWith<_$TodoEntityImpl> get copyWith =>
      __$$TodoEntityImplCopyWithImpl<_$TodoEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoEntityImplToJson(
      this,
    );
  }
}

abstract class _TodoEntity implements TodoEntity {
  const factory _TodoEntity(
      {final int? todoId,
      final String? firebaseTodoId,
      final String? title,
      final String? description,
      final bool? isCompleted,
      final DateTime? dueDate,
      final String? priority,
      final int? assignedTo,
      final String? tags,
      final int? createdBy,
      final int? updatedBy,
      final String? status,
      final DateTime? reminder,
      final String? attachment,
      final String? category,
      final int? estimatedTime,
      final int? actualTime,
      final bool? recurring,
      final String? recurringFrequency,
      final String? notes,
      final DateTime? completedAt,
      final String? colorCode,
      final bool? isArchived,
      final DateTime? startTime,
      final DateTime? endTime,
      final DateTime? date,
      final List<String>? tagNames}) = _$TodoEntityImpl;

  factory _TodoEntity.fromJson(Map<String, dynamic> json) =
      _$TodoEntityImpl.fromJson;

  @override
  int? get todoId;
  @override
  String? get firebaseTodoId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  bool? get isCompleted;
  @override
  DateTime? get dueDate;
  @override
  String? get priority; // e.g., low, medium, high
  @override
  int? get assignedTo;
  @override
  String? get tags;
  @override
  int? get createdBy;
  @override
  int? get updatedBy;
  @override
  String? get status; // e.g., pending, in progress, completed
  @override
  DateTime? get reminder;
  @override
  String? get attachment;
  @override
  String? get category;
  @override
  int? get estimatedTime;
  @override
  int? get actualTime;
  @override
  bool? get recurring;
  @override
  String? get recurringFrequency; // e.g., daily, weekly, monthly
  @override
  String? get notes;
  @override
  DateTime? get completedAt;
  @override
  String? get colorCode;
  @override
  bool? get isArchived;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  DateTime? get date;
  @override
  List<String>? get tagNames;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoEntityImplCopyWith<_$TodoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
