import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_project_entity.freezed.dart';
part 'todo_project_entity.g.dart';

@freezed
class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
    String? uuid,
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
    DateTime? updatedAt,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) => _$ProjectEntityFromJson(json);
}
