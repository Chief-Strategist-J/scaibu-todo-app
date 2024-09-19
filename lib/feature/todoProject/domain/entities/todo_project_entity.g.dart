// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_project_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectEntityImpl _$$ProjectEntityImplFromJson(Map<String, dynamic> json) =>
    _$ProjectEntityImpl(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      budget: (json['budget'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      progressPercentage: (json['progressPercentage'] as num?)?.toInt(),
      priority: json['priority'] as String?,
      isPublic: json['isPublic'] as bool?,
      clientName: json['clientName'] as String?,
      projectManager: json['projectManager'] as String?,
      estimatedHours: (json['estimatedHours'] as num?)?.toInt(),
      actualHours: (json['actualHours'] as num?)?.toInt(),
      repositoryUrl: json['repositoryUrl'] as String?,
      documentationUrl: json['documentationUrl'] as String?,
      category: json['category'] as String?,
      isArchived: json['isArchived'] as bool?,
      taskCount: (json['taskCount'] as num?)?.toInt(),
      completedTaskCount: (json['completedTaskCount'] as num?)?.toInt(),
      teamSize: (json['teamSize'] as num?)?.toInt(),
      lastActivityAt: json['lastActivityAt'] == null
          ? null
          : DateTime.parse(json['lastActivityAt'] as String),
      projectCode: json['projectCode'] as String?,
      riskScore: (json['riskScore'] as num?)?.toDouble(),
      statusColor: json['statusColor'] as String?,
      commentCount: (json['commentCount'] as num?)?.toInt(),
      attachmentCount: (json['attachmentCount'] as num?)?.toInt(),
      completionPercentage: (json['completionPercentage'] as num?)?.toDouble(),
      mainLanguage: json['mainLanguage'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      customerSatisfactionScore:
          (json['customerSatisfactionScore'] as num?)?.toDouble(),
      revisionCount: (json['revisionCount'] as num?)?.toInt(),
      projectType: json['projectType'] as String?,
      roi: (json['roi'] as num?)?.toDouble(),
      stakeholderCount: (json['stakeholderCount'] as num?)?.toInt(),
      budgetUtilization: (json['budgetUtilization'] as num?)?.toDouble(),
      projectPhase: json['projectPhase'] as String?,
      lessonsLearned: json['lessonsLearned'] as String?,
      createdBy: (json['createdBy'] as num?)?.toInt(),
      updatedBy: (json['updatedBy'] as num?)?.toInt(),
      departmentId: (json['departmentId'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProjectEntityImplToJson(_$ProjectEntityImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'status': instance.status,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'budget': instance.budget,
      'currency': instance.currency,
      'progressPercentage': instance.progressPercentage,
      'priority': instance.priority,
      'isPublic': instance.isPublic,
      'clientName': instance.clientName,
      'projectManager': instance.projectManager,
      'estimatedHours': instance.estimatedHours,
      'actualHours': instance.actualHours,
      'repositoryUrl': instance.repositoryUrl,
      'documentationUrl': instance.documentationUrl,
      'category': instance.category,
      'isArchived': instance.isArchived,
      'taskCount': instance.taskCount,
      'completedTaskCount': instance.completedTaskCount,
      'teamSize': instance.teamSize,
      'lastActivityAt': instance.lastActivityAt?.toIso8601String(),
      'projectCode': instance.projectCode,
      'riskScore': instance.riskScore,
      'statusColor': instance.statusColor,
      'commentCount': instance.commentCount,
      'attachmentCount': instance.attachmentCount,
      'completionPercentage': instance.completionPercentage,
      'mainLanguage': instance.mainLanguage,
      'isFeatured': instance.isFeatured,
      'customerSatisfactionScore': instance.customerSatisfactionScore,
      'revisionCount': instance.revisionCount,
      'projectType': instance.projectType,
      'roi': instance.roi,
      'stakeholderCount': instance.stakeholderCount,
      'budgetUtilization': instance.budgetUtilization,
      'projectPhase': instance.projectPhase,
      'lessonsLearned': instance.lessonsLearned,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'departmentId': instance.departmentId,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
