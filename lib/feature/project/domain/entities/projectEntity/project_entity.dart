import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_entity.freezed.dart';
part 'project_entity.g.dart';

@freezed
class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
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
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(final Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);
}
