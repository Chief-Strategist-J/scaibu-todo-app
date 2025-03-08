// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectEntity {
  String? get uuid;
  int? get id;
  String? get name;
  String? get slug;
  String? get description;
  String? get status;
  DateTime? get startDate;
  DateTime? get endDate;
  double? get budget;
  String? get currency;
  int? get progressPercentage;
  String? get priority;
  bool? get isPublic;
  String? get clientName;
  String? get projectManager;
  int? get estimatedHours;
  int? get actualHours;
  String? get repositoryUrl;
  String? get documentationUrl;
  String? get category;
  bool? get isArchived;
  int? get taskCount;
  int? get completedTaskCount;
  int? get teamSize;
  DateTime? get lastActivityAt;
  String? get projectCode;
  double? get riskScore;
  String? get statusColor;
  int? get commentCount;
  int? get attachmentCount;
  double? get completionPercentage;
  String? get mainLanguage;
  bool? get isFeatured;
  double? get customerSatisfactionScore;
  int? get revisionCount;
  String? get projectType;
  double? get roi;
  int? get stakeholderCount;
  double? get budgetUtilization;
  String? get projectPhase;
  String? get lessonsLearned;
  int? get createdBy;
  int? get updatedBy;
  int? get departmentId;
  DateTime? get deletedAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of ProjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectEntityCopyWith<ProjectEntity> get copyWith =>
      _$ProjectEntityCopyWithImpl<ProjectEntity>(
          this as ProjectEntity, _$identity);

  /// Serializes this ProjectEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectEntity &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.projectManager, projectManager) ||
                other.projectManager == projectManager) &&
            (identical(other.estimatedHours, estimatedHours) ||
                other.estimatedHours == estimatedHours) &&
            (identical(other.actualHours, actualHours) ||
                other.actualHours == actualHours) &&
            (identical(other.repositoryUrl, repositoryUrl) ||
                other.repositoryUrl == repositoryUrl) &&
            (identical(other.documentationUrl, documentationUrl) ||
                other.documentationUrl == documentationUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.taskCount, taskCount) ||
                other.taskCount == taskCount) &&
            (identical(other.completedTaskCount, completedTaskCount) ||
                other.completedTaskCount == completedTaskCount) &&
            (identical(other.teamSize, teamSize) ||
                other.teamSize == teamSize) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            (identical(other.statusColor, statusColor) ||
                other.statusColor == statusColor) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.attachmentCount, attachmentCount) ||
                other.attachmentCount == attachmentCount) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.mainLanguage, mainLanguage) ||
                other.mainLanguage == mainLanguage) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.customerSatisfactionScore,
                    customerSatisfactionScore) ||
                other.customerSatisfactionScore == customerSatisfactionScore) &&
            (identical(other.revisionCount, revisionCount) ||
                other.revisionCount == revisionCount) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.roi, roi) || other.roi == roi) &&
            (identical(other.stakeholderCount, stakeholderCount) ||
                other.stakeholderCount == stakeholderCount) &&
            (identical(other.budgetUtilization, budgetUtilization) ||
                other.budgetUtilization == budgetUtilization) &&
            (identical(other.projectPhase, projectPhase) ||
                other.projectPhase == projectPhase) &&
            (identical(other.lessonsLearned, lessonsLearned) ||
                other.lessonsLearned == lessonsLearned) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        id,
        name,
        slug,
        description,
        status,
        startDate,
        endDate,
        budget,
        currency,
        progressPercentage,
        priority,
        isPublic,
        clientName,
        projectManager,
        estimatedHours,
        actualHours,
        repositoryUrl,
        documentationUrl,
        category,
        isArchived,
        taskCount,
        completedTaskCount,
        teamSize,
        lastActivityAt,
        projectCode,
        riskScore,
        statusColor,
        commentCount,
        attachmentCount,
        completionPercentage,
        mainLanguage,
        isFeatured,
        customerSatisfactionScore,
        revisionCount,
        projectType,
        roi,
        stakeholderCount,
        budgetUtilization,
        projectPhase,
        lessonsLearned,
        createdBy,
        updatedBy,
        departmentId,
        deletedAt,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ProjectEntity(uuid: $uuid, id: $id, name: $name, slug: $slug, description: $description, status: $status, startDate: $startDate, endDate: $endDate, budget: $budget, currency: $currency, progressPercentage: $progressPercentage, priority: $priority, isPublic: $isPublic, clientName: $clientName, projectManager: $projectManager, estimatedHours: $estimatedHours, actualHours: $actualHours, repositoryUrl: $repositoryUrl, documentationUrl: $documentationUrl, category: $category, isArchived: $isArchived, taskCount: $taskCount, completedTaskCount: $completedTaskCount, teamSize: $teamSize, lastActivityAt: $lastActivityAt, projectCode: $projectCode, riskScore: $riskScore, statusColor: $statusColor, commentCount: $commentCount, attachmentCount: $attachmentCount, completionPercentage: $completionPercentage, mainLanguage: $mainLanguage, isFeatured: $isFeatured, customerSatisfactionScore: $customerSatisfactionScore, revisionCount: $revisionCount, projectType: $projectType, roi: $roi, stakeholderCount: $stakeholderCount, budgetUtilization: $budgetUtilization, projectPhase: $projectPhase, lessonsLearned: $lessonsLearned, createdBy: $createdBy, updatedBy: $updatedBy, departmentId: $departmentId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ProjectEntityCopyWith<$Res> {
  factory $ProjectEntityCopyWith(
          ProjectEntity value, $Res Function(ProjectEntity) _then) =
      _$ProjectEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? uuid,
      int? id,
      String? name,
      String? slug,
      String? description,
      String? status,
      DateTime? startDate,
      DateTime? endDate,
      double? budget,
      String? currency,
      int? progressPercentage,
      String? priority,
      bool? isPublic,
      String? clientName,
      String? projectManager,
      int? estimatedHours,
      int? actualHours,
      String? repositoryUrl,
      String? documentationUrl,
      String? category,
      bool? isArchived,
      int? taskCount,
      int? completedTaskCount,
      int? teamSize,
      DateTime? lastActivityAt,
      String? projectCode,
      double? riskScore,
      String? statusColor,
      int? commentCount,
      int? attachmentCount,
      double? completionPercentage,
      String? mainLanguage,
      bool? isFeatured,
      double? customerSatisfactionScore,
      int? revisionCount,
      String? projectType,
      double? roi,
      int? stakeholderCount,
      double? budgetUtilization,
      String? projectPhase,
      String? lessonsLearned,
      int? createdBy,
      int? updatedBy,
      int? departmentId,
      DateTime? deletedAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._self, this._then);

  final ProjectEntity _self;
  final $Res Function(ProjectEntity) _then;

  /// Create a copy of ProjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? budget = freezed,
    Object? currency = freezed,
    Object? progressPercentage = freezed,
    Object? priority = freezed,
    Object? isPublic = freezed,
    Object? clientName = freezed,
    Object? projectManager = freezed,
    Object? estimatedHours = freezed,
    Object? actualHours = freezed,
    Object? repositoryUrl = freezed,
    Object? documentationUrl = freezed,
    Object? category = freezed,
    Object? isArchived = freezed,
    Object? taskCount = freezed,
    Object? completedTaskCount = freezed,
    Object? teamSize = freezed,
    Object? lastActivityAt = freezed,
    Object? projectCode = freezed,
    Object? riskScore = freezed,
    Object? statusColor = freezed,
    Object? commentCount = freezed,
    Object? attachmentCount = freezed,
    Object? completionPercentage = freezed,
    Object? mainLanguage = freezed,
    Object? isFeatured = freezed,
    Object? customerSatisfactionScore = freezed,
    Object? revisionCount = freezed,
    Object? projectType = freezed,
    Object? roi = freezed,
    Object? stakeholderCount = freezed,
    Object? budgetUtilization = freezed,
    Object? projectPhase = freezed,
    Object? lessonsLearned = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? departmentId = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      budget: freezed == budget
          ? _self.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      progressPercentage: freezed == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublic: freezed == isPublic
          ? _self.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientName: freezed == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectManager: freezed == projectManager
          ? _self.projectManager
          : projectManager // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedHours: freezed == estimatedHours
          ? _self.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as int?,
      actualHours: freezed == actualHours
          ? _self.actualHours
          : actualHours // ignore: cast_nullable_to_non_nullable
              as int?,
      repositoryUrl: freezed == repositoryUrl
          ? _self.repositoryUrl
          : repositoryUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      documentationUrl: freezed == documentationUrl
          ? _self.documentationUrl
          : documentationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      taskCount: freezed == taskCount
          ? _self.taskCount
          : taskCount // ignore: cast_nullable_to_non_nullable
              as int?,
      completedTaskCount: freezed == completedTaskCount
          ? _self.completedTaskCount
          : completedTaskCount // ignore: cast_nullable_to_non_nullable
              as int?,
      teamSize: freezed == teamSize
          ? _self.teamSize
          : teamSize // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityAt: freezed == lastActivityAt
          ? _self.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectCode: freezed == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      riskScore: freezed == riskScore
          ? _self.riskScore
          : riskScore // ignore: cast_nullable_to_non_nullable
              as double?,
      statusColor: freezed == statusColor
          ? _self.statusColor
          : statusColor // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: freezed == commentCount
          ? _self.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      attachmentCount: freezed == attachmentCount
          ? _self.attachmentCount
          : attachmentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      completionPercentage: freezed == completionPercentage
          ? _self.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      mainLanguage: freezed == mainLanguage
          ? _self.mainLanguage
          : mainLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFeatured: freezed == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerSatisfactionScore: freezed == customerSatisfactionScore
          ? _self.customerSatisfactionScore
          : customerSatisfactionScore // ignore: cast_nullable_to_non_nullable
              as double?,
      revisionCount: freezed == revisionCount
          ? _self.revisionCount
          : revisionCount // ignore: cast_nullable_to_non_nullable
              as int?,
      projectType: freezed == projectType
          ? _self.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as String?,
      roi: freezed == roi
          ? _self.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as double?,
      stakeholderCount: freezed == stakeholderCount
          ? _self.stakeholderCount
          : stakeholderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      budgetUtilization: freezed == budgetUtilization
          ? _self.budgetUtilization
          : budgetUtilization // ignore: cast_nullable_to_non_nullable
              as double?,
      projectPhase: freezed == projectPhase
          ? _self.projectPhase
          : projectPhase // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonsLearned: freezed == lessonsLearned
          ? _self.lessonsLearned
          : lessonsLearned // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _self.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
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
class _ProjectEntity implements ProjectEntity {
  const _ProjectEntity(
      {this.uuid,
      this.id,
      this.name,
      this.slug,
      this.description,
      this.status,
      this.startDate,
      this.endDate,
      this.budget,
      this.currency,
      this.progressPercentage,
      this.priority,
      this.isPublic,
      this.clientName,
      this.projectManager,
      this.estimatedHours,
      this.actualHours,
      this.repositoryUrl,
      this.documentationUrl,
      this.category,
      this.isArchived,
      this.taskCount,
      this.completedTaskCount,
      this.teamSize,
      this.lastActivityAt,
      this.projectCode,
      this.riskScore,
      this.statusColor,
      this.commentCount,
      this.attachmentCount,
      this.completionPercentage,
      this.mainLanguage,
      this.isFeatured,
      this.customerSatisfactionScore,
      this.revisionCount,
      this.projectType,
      this.roi,
      this.stakeholderCount,
      this.budgetUtilization,
      this.projectPhase,
      this.lessonsLearned,
      this.createdBy,
      this.updatedBy,
      this.departmentId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});
  factory _ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);

  @override
  final String? uuid;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? status;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? budget;
  @override
  final String? currency;
  @override
  final int? progressPercentage;
  @override
  final String? priority;
  @override
  final bool? isPublic;
  @override
  final String? clientName;
  @override
  final String? projectManager;
  @override
  final int? estimatedHours;
  @override
  final int? actualHours;
  @override
  final String? repositoryUrl;
  @override
  final String? documentationUrl;
  @override
  final String? category;
  @override
  final bool? isArchived;
  @override
  final int? taskCount;
  @override
  final int? completedTaskCount;
  @override
  final int? teamSize;
  @override
  final DateTime? lastActivityAt;
  @override
  final String? projectCode;
  @override
  final double? riskScore;
  @override
  final String? statusColor;
  @override
  final int? commentCount;
  @override
  final int? attachmentCount;
  @override
  final double? completionPercentage;
  @override
  final String? mainLanguage;
  @override
  final bool? isFeatured;
  @override
  final double? customerSatisfactionScore;
  @override
  final int? revisionCount;
  @override
  final String? projectType;
  @override
  final double? roi;
  @override
  final int? stakeholderCount;
  @override
  final double? budgetUtilization;
  @override
  final String? projectPhase;
  @override
  final String? lessonsLearned;
  @override
  final int? createdBy;
  @override
  final int? updatedBy;
  @override
  final int? departmentId;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of ProjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectEntityCopyWith<_ProjectEntity> get copyWith =>
      __$ProjectEntityCopyWithImpl<_ProjectEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectEntity &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.projectManager, projectManager) ||
                other.projectManager == projectManager) &&
            (identical(other.estimatedHours, estimatedHours) ||
                other.estimatedHours == estimatedHours) &&
            (identical(other.actualHours, actualHours) ||
                other.actualHours == actualHours) &&
            (identical(other.repositoryUrl, repositoryUrl) ||
                other.repositoryUrl == repositoryUrl) &&
            (identical(other.documentationUrl, documentationUrl) ||
                other.documentationUrl == documentationUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.taskCount, taskCount) ||
                other.taskCount == taskCount) &&
            (identical(other.completedTaskCount, completedTaskCount) ||
                other.completedTaskCount == completedTaskCount) &&
            (identical(other.teamSize, teamSize) ||
                other.teamSize == teamSize) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            (identical(other.statusColor, statusColor) ||
                other.statusColor == statusColor) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.attachmentCount, attachmentCount) ||
                other.attachmentCount == attachmentCount) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.mainLanguage, mainLanguage) ||
                other.mainLanguage == mainLanguage) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.customerSatisfactionScore,
                    customerSatisfactionScore) ||
                other.customerSatisfactionScore == customerSatisfactionScore) &&
            (identical(other.revisionCount, revisionCount) ||
                other.revisionCount == revisionCount) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.roi, roi) || other.roi == roi) &&
            (identical(other.stakeholderCount, stakeholderCount) ||
                other.stakeholderCount == stakeholderCount) &&
            (identical(other.budgetUtilization, budgetUtilization) ||
                other.budgetUtilization == budgetUtilization) &&
            (identical(other.projectPhase, projectPhase) ||
                other.projectPhase == projectPhase) &&
            (identical(other.lessonsLearned, lessonsLearned) ||
                other.lessonsLearned == lessonsLearned) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        id,
        name,
        slug,
        description,
        status,
        startDate,
        endDate,
        budget,
        currency,
        progressPercentage,
        priority,
        isPublic,
        clientName,
        projectManager,
        estimatedHours,
        actualHours,
        repositoryUrl,
        documentationUrl,
        category,
        isArchived,
        taskCount,
        completedTaskCount,
        teamSize,
        lastActivityAt,
        projectCode,
        riskScore,
        statusColor,
        commentCount,
        attachmentCount,
        completionPercentage,
        mainLanguage,
        isFeatured,
        customerSatisfactionScore,
        revisionCount,
        projectType,
        roi,
        stakeholderCount,
        budgetUtilization,
        projectPhase,
        lessonsLearned,
        createdBy,
        updatedBy,
        departmentId,
        deletedAt,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ProjectEntity(uuid: $uuid, id: $id, name: $name, slug: $slug, description: $description, status: $status, startDate: $startDate, endDate: $endDate, budget: $budget, currency: $currency, progressPercentage: $progressPercentage, priority: $priority, isPublic: $isPublic, clientName: $clientName, projectManager: $projectManager, estimatedHours: $estimatedHours, actualHours: $actualHours, repositoryUrl: $repositoryUrl, documentationUrl: $documentationUrl, category: $category, isArchived: $isArchived, taskCount: $taskCount, completedTaskCount: $completedTaskCount, teamSize: $teamSize, lastActivityAt: $lastActivityAt, projectCode: $projectCode, riskScore: $riskScore, statusColor: $statusColor, commentCount: $commentCount, attachmentCount: $attachmentCount, completionPercentage: $completionPercentage, mainLanguage: $mainLanguage, isFeatured: $isFeatured, customerSatisfactionScore: $customerSatisfactionScore, revisionCount: $revisionCount, projectType: $projectType, roi: $roi, stakeholderCount: $stakeholderCount, budgetUtilization: $budgetUtilization, projectPhase: $projectPhase, lessonsLearned: $lessonsLearned, createdBy: $createdBy, updatedBy: $updatedBy, departmentId: $departmentId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProjectEntityCopyWith<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  factory _$ProjectEntityCopyWith(
          _ProjectEntity value, $Res Function(_ProjectEntity) _then) =
      __$ProjectEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? uuid,
      int? id,
      String? name,
      String? slug,
      String? description,
      String? status,
      DateTime? startDate,
      DateTime? endDate,
      double? budget,
      String? currency,
      int? progressPercentage,
      String? priority,
      bool? isPublic,
      String? clientName,
      String? projectManager,
      int? estimatedHours,
      int? actualHours,
      String? repositoryUrl,
      String? documentationUrl,
      String? category,
      bool? isArchived,
      int? taskCount,
      int? completedTaskCount,
      int? teamSize,
      DateTime? lastActivityAt,
      String? projectCode,
      double? riskScore,
      String? statusColor,
      int? commentCount,
      int? attachmentCount,
      double? completionPercentage,
      String? mainLanguage,
      bool? isFeatured,
      double? customerSatisfactionScore,
      int? revisionCount,
      String? projectType,
      double? roi,
      int? stakeholderCount,
      double? budgetUtilization,
      String? projectPhase,
      String? lessonsLearned,
      int? createdBy,
      int? updatedBy,
      int? departmentId,
      DateTime? deletedAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$ProjectEntityCopyWithImpl<$Res>
    implements _$ProjectEntityCopyWith<$Res> {
  __$ProjectEntityCopyWithImpl(this._self, this._then);

  final _ProjectEntity _self;
  final $Res Function(_ProjectEntity) _then;

  /// Create a copy of ProjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? budget = freezed,
    Object? currency = freezed,
    Object? progressPercentage = freezed,
    Object? priority = freezed,
    Object? isPublic = freezed,
    Object? clientName = freezed,
    Object? projectManager = freezed,
    Object? estimatedHours = freezed,
    Object? actualHours = freezed,
    Object? repositoryUrl = freezed,
    Object? documentationUrl = freezed,
    Object? category = freezed,
    Object? isArchived = freezed,
    Object? taskCount = freezed,
    Object? completedTaskCount = freezed,
    Object? teamSize = freezed,
    Object? lastActivityAt = freezed,
    Object? projectCode = freezed,
    Object? riskScore = freezed,
    Object? statusColor = freezed,
    Object? commentCount = freezed,
    Object? attachmentCount = freezed,
    Object? completionPercentage = freezed,
    Object? mainLanguage = freezed,
    Object? isFeatured = freezed,
    Object? customerSatisfactionScore = freezed,
    Object? revisionCount = freezed,
    Object? projectType = freezed,
    Object? roi = freezed,
    Object? stakeholderCount = freezed,
    Object? budgetUtilization = freezed,
    Object? projectPhase = freezed,
    Object? lessonsLearned = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? departmentId = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_ProjectEntity(
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      budget: freezed == budget
          ? _self.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      progressPercentage: freezed == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublic: freezed == isPublic
          ? _self.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientName: freezed == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectManager: freezed == projectManager
          ? _self.projectManager
          : projectManager // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedHours: freezed == estimatedHours
          ? _self.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as int?,
      actualHours: freezed == actualHours
          ? _self.actualHours
          : actualHours // ignore: cast_nullable_to_non_nullable
              as int?,
      repositoryUrl: freezed == repositoryUrl
          ? _self.repositoryUrl
          : repositoryUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      documentationUrl: freezed == documentationUrl
          ? _self.documentationUrl
          : documentationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      taskCount: freezed == taskCount
          ? _self.taskCount
          : taskCount // ignore: cast_nullable_to_non_nullable
              as int?,
      completedTaskCount: freezed == completedTaskCount
          ? _self.completedTaskCount
          : completedTaskCount // ignore: cast_nullable_to_non_nullable
              as int?,
      teamSize: freezed == teamSize
          ? _self.teamSize
          : teamSize // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityAt: freezed == lastActivityAt
          ? _self.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectCode: freezed == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      riskScore: freezed == riskScore
          ? _self.riskScore
          : riskScore // ignore: cast_nullable_to_non_nullable
              as double?,
      statusColor: freezed == statusColor
          ? _self.statusColor
          : statusColor // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: freezed == commentCount
          ? _self.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      attachmentCount: freezed == attachmentCount
          ? _self.attachmentCount
          : attachmentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      completionPercentage: freezed == completionPercentage
          ? _self.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      mainLanguage: freezed == mainLanguage
          ? _self.mainLanguage
          : mainLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFeatured: freezed == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerSatisfactionScore: freezed == customerSatisfactionScore
          ? _self.customerSatisfactionScore
          : customerSatisfactionScore // ignore: cast_nullable_to_non_nullable
              as double?,
      revisionCount: freezed == revisionCount
          ? _self.revisionCount
          : revisionCount // ignore: cast_nullable_to_non_nullable
              as int?,
      projectType: freezed == projectType
          ? _self.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as String?,
      roi: freezed == roi
          ? _self.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as double?,
      stakeholderCount: freezed == stakeholderCount
          ? _self.stakeholderCount
          : stakeholderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      budgetUtilization: freezed == budgetUtilization
          ? _self.budgetUtilization
          : budgetUtilization // ignore: cast_nullable_to_non_nullable
              as double?,
      projectPhase: freezed == projectPhase
          ? _self.projectPhase
          : projectPhase // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonsLearned: freezed == lessonsLearned
          ? _self.lessonsLearned
          : lessonsLearned // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _self.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
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
