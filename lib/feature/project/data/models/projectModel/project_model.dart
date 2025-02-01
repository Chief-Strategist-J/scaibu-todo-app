import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

/// Mixin that defines the common interface for a project entity.
mixin ProjectModelMixin {
  /// Doc Required
  String? get uuid;

  /// Doc Required
  String? get name;

  /// Doc Required
  String? get slug;

  /// Doc Required
  String? get description;

  /// Doc Required
  String? get status;

  /// Doc Required
  DateTime? get startDate;

  /// Doc Required
  DateTime? get endDate;

  /// Doc Required
  double? get budget;

  /// Doc Required
  String? get currency;

  /// Doc Required
  int? get progressPercentage;

  /// Doc Required
  String? get priority;

  /// Doc Required
  bool? get isPublic;

  /// Doc Required
  String? get clientName;

  /// Doc Required
  String? get projectManager;

  /// Doc Required
  int? get estimatedHours;

  /// Doc Required
  int? get actualHours;

  /// Doc Required
  String? get repositoryUrl;

  /// Doc Required
  String? get documentationUrl;

  /// Doc Required
  String? get category;

  /// Doc Required
  bool? get isArchived;

  /// Doc Required
  int? get taskCount;

  /// Doc Required
  int? get completedTaskCount;

  /// Doc Required
  int? get teamSize;

  /// Doc Required
  DateTime? get lastActivityAt;

  /// Doc Required
  String? get projectCode;

  /// Doc Required
  double? get riskScore;

  /// Doc Required
  String? get statusColor;

  /// Doc Required
  int? get commentCount;

  /// Doc Required
  int? get attachmentCount;

  /// Doc Required
  double? get completionPercentage;

  /// Doc Required
  String? get mainLanguage;

  /// Doc Required
  bool? get isFeatured;

  /// Doc Required
  double? get customerSatisfactionScore;

  /// Doc Required
  int? get revisionCount;

  /// Doc Required
  String? get projectType;

  /// Doc Required
  double? get roi;

  /// Doc Required
  int? get stakeholderCount;

  /// Doc Required
  double? get budgetUtilization;

  /// Doc Required
  String? get projectPhase;

  /// Doc Required
  String? get lessonsLearned;

  /// Doc Required
  int? get createdBy;

  /// Doc Required
  int? get updatedBy;

  /// Doc Required
  int? get departmentId;

  /// Doc Required
  DateTime? get deletedAt;

  /// Doc Required
  DateTime? get createdAt;

  /// Doc Required
  DateTime? get updatedAt;
}
/// Doc Required
@freezed
class ProjectModel with _$ProjectModel, ProjectModelMixin {
  /// Doc Required
  const factory ProjectModel({
    final String? uuid,
    final String? name,
    final String? slug,
    final String? description,
    final String? status,
    final DateTime? startDate,
    final DateTime? endDate,
    final double? budget,
    final String? currency,
    final int? progressPercentage,
    final String? priority,
    final bool? isPublic,
    final String? clientName,
    final String? projectManager,
    final int? estimatedHours,
    final int? actualHours,
    final String? repositoryUrl,
    final String? documentationUrl,
    final String? category,
    final bool? isArchived,
    final int? taskCount,
    final int? completedTaskCount,
    final int? teamSize,
    final DateTime? lastActivityAt,
    final String? projectCode,
    final double? riskScore,
    final String? statusColor,
    final int? commentCount,
    final int? attachmentCount,
    final double? completionPercentage,
    final String? mainLanguage,
    final bool? isFeatured,
    final double? customerSatisfactionScore,
    final int? revisionCount,
    final String? projectType,
    final double? roi,
    final int? stakeholderCount,
    final double? budgetUtilization,
    final String? projectPhase,
    final String? lessonsLearned,
    final int? createdBy,
    final int? updatedBy,
    final int? departmentId,
    final DateTime? deletedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _ProjectModel;

  /// Doc Required
  factory ProjectModel.fromJson(final Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
