import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_project_model.freezed.dart';
part 'todo_project_model.g.dart';

/// Mixin that defines the common interface for a project model.
mixin ProjectModelMixin {
  String? get uuid;
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
}


@freezed
class TodoProjectModel with _$TodoProjectModel, ProjectModelMixin {
  const factory TodoProjectModel({
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
  }) = _TodoProjectModel;

  factory TodoProjectModel.fromJson(Map<String, dynamic> json) => _$TodoProjectModelFromJson(json);
}
