// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoEntity {
  int? get todoId;
  String? get firebaseTodoId;
  String? get title;
  String? get description;
  bool? get isCompleted;
  DateTime? get dueDate;
  String? get priority; // e.g., low, medium, high
  int? get assignedTo;
  String? get tags;
  int? get createdBy;
  int? get updatedBy;
  String? get status; // e.g., pending, in progress, completed
  DateTime? get reminder;
  String? get attachment;
  String? get category;
  int? get estimatedTime;
  int? get actualTime;
  bool? get recurring;
  String? get recurringFrequency; // e.g., daily, weekly, monthly
  String? get notes;
  DateTime? get completedAt;
  String? get colorCode;
  bool? get isArchived;
  DateTime? get startTime;
  DateTime? get endTime;
  DateTime? get date;
  List<String>? get tagNames;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoEntityCopyWith<TodoEntity> get copyWith =>
      _$TodoEntityCopyWithImpl<TodoEntity>(this as TodoEntity, _$identity);

  /// Serializes this TodoEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoEntity &&
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
            const DeepCollectionEquality().equals(other.tagNames, tagNames));
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
        const DeepCollectionEquality().hash(tagNames)
      ]);

  @override
  String toString() {
    return 'TodoEntity(todoId: $todoId, firebaseTodoId: $firebaseTodoId, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, assignedTo: $assignedTo, tags: $tags, createdBy: $createdBy, updatedBy: $updatedBy, status: $status, reminder: $reminder, attachment: $attachment, category: $category, estimatedTime: $estimatedTime, actualTime: $actualTime, recurring: $recurring, recurringFrequency: $recurringFrequency, notes: $notes, completedAt: $completedAt, colorCode: $colorCode, isArchived: $isArchived, startTime: $startTime, endTime: $endTime, date: $date, tagNames: $tagNames)';
  }
}

/// @nodoc
abstract mixin class $TodoEntityCopyWith<$Res> {
  factory $TodoEntityCopyWith(
          TodoEntity value, $Res Function(TodoEntity) _then) =
      _$TodoEntityCopyWithImpl;
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
class _$TodoEntityCopyWithImpl<$Res> implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._self, this._then);

  final TodoEntity _self;
  final $Res Function(TodoEntity) _then;

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
    return _then(_self.copyWith(
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      firebaseTodoId: freezed == firebaseTodoId
          ? _self.firebaseTodoId
          : firebaseTodoId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reminder: freezed == reminder
          ? _self.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachment: freezed == attachment
          ? _self.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _self.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      actualTime: freezed == actualTime
          ? _self.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as int?,
      recurring: freezed == recurring
          ? _self.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      recurringFrequency: freezed == recurringFrequency
          ? _self.recurringFrequency
          : recurringFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagNames: freezed == tagNames
          ? _self.tagNames
          : tagNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TodoEntity implements TodoEntity {
  const _TodoEntity(
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
  factory _TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);

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

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoEntityCopyWith<_TodoEntity> get copyWith =>
      __$TodoEntityCopyWithImpl<_TodoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodoEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoEntity &&
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

  @override
  String toString() {
    return 'TodoEntity(todoId: $todoId, firebaseTodoId: $firebaseTodoId, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, assignedTo: $assignedTo, tags: $tags, createdBy: $createdBy, updatedBy: $updatedBy, status: $status, reminder: $reminder, attachment: $attachment, category: $category, estimatedTime: $estimatedTime, actualTime: $actualTime, recurring: $recurring, recurringFrequency: $recurringFrequency, notes: $notes, completedAt: $completedAt, colorCode: $colorCode, isArchived: $isArchived, startTime: $startTime, endTime: $endTime, date: $date, tagNames: $tagNames)';
  }
}

/// @nodoc
abstract mixin class _$TodoEntityCopyWith<$Res>
    implements $TodoEntityCopyWith<$Res> {
  factory _$TodoEntityCopyWith(
          _TodoEntity value, $Res Function(_TodoEntity) _then) =
      __$TodoEntityCopyWithImpl;
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
class __$TodoEntityCopyWithImpl<$Res> implements _$TodoEntityCopyWith<$Res> {
  __$TodoEntityCopyWithImpl(this._self, this._then);

  final _TodoEntity _self;
  final $Res Function(_TodoEntity) _then;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_TodoEntity(
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
      firebaseTodoId: freezed == firebaseTodoId
          ? _self.firebaseTodoId
          : firebaseTodoId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reminder: freezed == reminder
          ? _self.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachment: freezed == attachment
          ? _self.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _self.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      actualTime: freezed == actualTime
          ? _self.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as int?,
      recurring: freezed == recurring
          ? _self.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      recurringFrequency: freezed == recurringFrequency
          ? _self.recurringFrequency
          : recurringFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagNames: freezed == tagNames
          ? _self._tagNames
          : tagNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
