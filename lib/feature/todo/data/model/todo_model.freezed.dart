// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoModel implements DiagnosticableTreeMixin {
  int? get todoId;
  String? get title;
  String? get description;
  bool? get isCompleted;
  DateTime? get dueDate;
  int? get priority;
  String? get assignedTo;
  List<String>? get tags;
  int? get createdBy;
  int? get updatedBy;
  String? get status;
  DateTime? get reminder;
  String? get attachment;
  String? get category;
  String? get estimatedTime;
  String? get actualTime;
  bool? get recurring;
  String? get recurringFrequency;
  String? get notes;
  DateTime? get completedAt;
  String? get colorCode;
  bool? get isArchived;
  String? get firebaseTodoId;
  DateTime? get date;
  DateTime? get startTime;
  DateTime? get endTime;
  List<String>? get tagNames;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<TodoModel> get copyWith =>
      _$TodoModelCopyWithImpl<TodoModel>(this as TodoModel, _$identity);

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TodoModel'))
      ..add(DiagnosticsProperty('todoId', todoId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('isCompleted', isCompleted))
      ..add(DiagnosticsProperty('dueDate', dueDate))
      ..add(DiagnosticsProperty('priority', priority))
      ..add(DiagnosticsProperty('assignedTo', assignedTo))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('updatedBy', updatedBy))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('reminder', reminder))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('estimatedTime', estimatedTime))
      ..add(DiagnosticsProperty('actualTime', actualTime))
      ..add(DiagnosticsProperty('recurring', recurring))
      ..add(DiagnosticsProperty('recurringFrequency', recurringFrequency))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('completedAt', completedAt))
      ..add(DiagnosticsProperty('colorCode', colorCode))
      ..add(DiagnosticsProperty('isArchived', isArchived))
      ..add(DiagnosticsProperty('firebaseTodoId', firebaseTodoId))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('tagNames', tagNames));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoModel &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
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
            (identical(other.firebaseTodoId, firebaseTodoId) ||
                other.firebaseTodoId == firebaseTodoId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other.tagNames, tagNames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        todoId,
        title,
        description,
        isCompleted,
        dueDate,
        priority,
        assignedTo,
        const DeepCollectionEquality().hash(tags),
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
        firebaseTodoId,
        date,
        startTime,
        endTime,
        const DeepCollectionEquality().hash(tagNames)
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoModel(todoId: $todoId, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, assignedTo: $assignedTo, tags: $tags, createdBy: $createdBy, updatedBy: $updatedBy, status: $status, reminder: $reminder, attachment: $attachment, category: $category, estimatedTime: $estimatedTime, actualTime: $actualTime, recurring: $recurring, recurringFrequency: $recurringFrequency, notes: $notes, completedAt: $completedAt, colorCode: $colorCode, isArchived: $isArchived, firebaseTodoId: $firebaseTodoId, date: $date, startTime: $startTime, endTime: $endTime, tagNames: $tagNames)';
  }
}

/// @nodoc
abstract mixin class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) _then) =
      _$TodoModelCopyWithImpl;
  @useResult
  $Res call(
      {int? todoId,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? dueDate,
      int? priority,
      String? assignedTo,
      List<String>? tags,
      int? createdBy,
      int? updatedBy,
      String? status,
      DateTime? reminder,
      String? attachment,
      String? category,
      String? estimatedTime,
      String? actualTime,
      bool? recurring,
      String? recurringFrequency,
      String? notes,
      DateTime? completedAt,
      String? colorCode,
      bool? isArchived,
      String? firebaseTodoId,
      DateTime? date,
      DateTime? startTime,
      DateTime? endTime,
      List<String>? tagNames});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res> implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._self, this._then);

  final TodoModel _self;
  final $Res Function(TodoModel) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = freezed,
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
    Object? firebaseTodoId = freezed,
    Object? date = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? tagNames = freezed,
  }) {
    return _then(_self.copyWith(
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as int?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
              as String?,
      actualTime: freezed == actualTime
          ? _self.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      firebaseTodoId: freezed == firebaseTodoId
          ? _self.firebaseTodoId
          : firebaseTodoId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
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
class _TodoModel extends TodoModel with DiagnosticableTreeMixin {
  const _TodoModel(
      {this.todoId,
      this.title,
      this.description,
      this.isCompleted,
      this.dueDate,
      this.priority,
      this.assignedTo,
      final List<String>? tags,
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
      this.firebaseTodoId,
      this.date,
      this.startTime,
      this.endTime,
      final List<String>? tagNames})
      : _tags = tags,
        _tagNames = tagNames,
        super._();
  factory _TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  @override
  final int? todoId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? isCompleted;
  @override
  final DateTime? dueDate;
  @override
  final int? priority;
  @override
  final String? assignedTo;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? createdBy;
  @override
  final int? updatedBy;
  @override
  final String? status;
  @override
  final DateTime? reminder;
  @override
  final String? attachment;
  @override
  final String? category;
  @override
  final String? estimatedTime;
  @override
  final String? actualTime;
  @override
  final bool? recurring;
  @override
  final String? recurringFrequency;
  @override
  final String? notes;
  @override
  final DateTime? completedAt;
  @override
  final String? colorCode;
  @override
  final bool? isArchived;
  @override
  final String? firebaseTodoId;
  @override
  final DateTime? date;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  final List<String>? _tagNames;
  @override
  List<String>? get tagNames {
    final value = _tagNames;
    if (value == null) return null;
    if (_tagNames is EqualUnmodifiableListView) return _tagNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoModelCopyWith<_TodoModel> get copyWith =>
      __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodoModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TodoModel'))
      ..add(DiagnosticsProperty('todoId', todoId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('isCompleted', isCompleted))
      ..add(DiagnosticsProperty('dueDate', dueDate))
      ..add(DiagnosticsProperty('priority', priority))
      ..add(DiagnosticsProperty('assignedTo', assignedTo))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('updatedBy', updatedBy))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('reminder', reminder))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('estimatedTime', estimatedTime))
      ..add(DiagnosticsProperty('actualTime', actualTime))
      ..add(DiagnosticsProperty('recurring', recurring))
      ..add(DiagnosticsProperty('recurringFrequency', recurringFrequency))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('completedAt', completedAt))
      ..add(DiagnosticsProperty('colorCode', colorCode))
      ..add(DiagnosticsProperty('isArchived', isArchived))
      ..add(DiagnosticsProperty('firebaseTodoId', firebaseTodoId))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('tagNames', tagNames));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoModel &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
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
            const DeepCollectionEquality().equals(other._tags, _tags) &&
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
            (identical(other.firebaseTodoId, firebaseTodoId) ||
                other.firebaseTodoId == firebaseTodoId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._tagNames, _tagNames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        todoId,
        title,
        description,
        isCompleted,
        dueDate,
        priority,
        assignedTo,
        const DeepCollectionEquality().hash(_tags),
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
        firebaseTodoId,
        date,
        startTime,
        endTime,
        const DeepCollectionEquality().hash(_tagNames)
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoModel(todoId: $todoId, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, assignedTo: $assignedTo, tags: $tags, createdBy: $createdBy, updatedBy: $updatedBy, status: $status, reminder: $reminder, attachment: $attachment, category: $category, estimatedTime: $estimatedTime, actualTime: $actualTime, recurring: $recurring, recurringFrequency: $recurringFrequency, notes: $notes, completedAt: $completedAt, colorCode: $colorCode, isArchived: $isArchived, firebaseTodoId: $firebaseTodoId, date: $date, startTime: $startTime, endTime: $endTime, tagNames: $tagNames)';
  }
}

/// @nodoc
abstract mixin class _$TodoModelCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(
          _TodoModel value, $Res Function(_TodoModel) _then) =
      __$TodoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? todoId,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? dueDate,
      int? priority,
      String? assignedTo,
      List<String>? tags,
      int? createdBy,
      int? updatedBy,
      String? status,
      DateTime? reminder,
      String? attachment,
      String? category,
      String? estimatedTime,
      String? actualTime,
      bool? recurring,
      String? recurringFrequency,
      String? notes,
      DateTime? completedAt,
      String? colorCode,
      bool? isArchived,
      String? firebaseTodoId,
      DateTime? date,
      DateTime? startTime,
      DateTime? endTime,
      List<String>? tagNames});
}

/// @nodoc
class __$TodoModelCopyWithImpl<$Res> implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(this._self, this._then);

  final _TodoModel _self;
  final $Res Function(_TodoModel) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todoId = freezed,
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
    Object? firebaseTodoId = freezed,
    Object? date = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? tagNames = freezed,
  }) {
    return _then(_TodoModel(
      todoId: freezed == todoId
          ? _self.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as int?,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
              as String?,
      actualTime: freezed == actualTime
          ? _self.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      firebaseTodoId: freezed == firebaseTodoId
          ? _self.firebaseTodoId
          : firebaseTodoId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagNames: freezed == tagNames
          ? _self._tagNames
          : tagNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
