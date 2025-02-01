import 'package:todo_app/core/app_library.dart';

part 'tags_model.freezed.dart';
part 'tags_model.g.dart';

/// Doc Required
mixin TagEntityMixin {
  /// Doc Required

  int? get id;

  /// Doc Required

  String? get uuid;

  /// Doc Required

  bool? get isActive;

  /// Doc Required

  int? get order;

  /// Doc Required

  int? get version;

  /// Doc Required

  int? get followerCount;

  /// Doc Required

  int? get usageCount;

  /// Doc Required

  int? get relatedPostsCount;

  /// Doc Required

  int? get userInteractionCount;

  /// Doc Required

  double? get popularityScore;

  /// Doc Required

  String? get name;

  /// Doc Required

  String? get slug;

  /// Doc Required

  String? get metaTitle;

  /// Doc Required

  String? get color;

  /// Doc Required

  String? get imageUrl;

  /// Doc Required

  String? get tagType;

  /// Doc Required

  String? get contentType;

  /// Doc Required

  String? get descriptionVector;

  /// Doc Required

  String? get metaDescription;

  /// Doc Required

  String? get description;

  /// Doc Required

  Map<String, dynamic>? get geolocationData;

  /// Doc Required

  Map<String, dynamic>? get metaData;

  /// Doc Required

  DateTime? get deletedAt;

  /// Doc Required

  int? get createdBy;

  /// Doc Required

  int? get parentId;

  /// Doc Required

  int? get todoId;

  /// Doc Required

  DateTime? get lastTrendUpdate;

  /// Doc Required

  DateTime? get lastUsedAt;

  /// Doc Required

  DateTime? get createdAt;

  /// Doc Required

  DateTime? get updatedAt;
}

/// Doc Required
@freezed
class TagsModel with _$TagsModel, TagEntityMixin {
  /// Doc Required
  const factory TagsModel({
    final int? id,
    final String? uuid,
    final bool? isActive,
    final int? order,
    final int? version,
    final int? followerCount,
    final int? usageCount,
    final int? relatedPostsCount,
    final int? userInteractionCount,
    final double? popularityScore,
    final String? name,
    final String? slug,
    final String? metaTitle,
    final String? color,
    final String? imageUrl,
    final String? tagType,
    final String? contentType,
    final String? descriptionVector,
    final String? metaDescription,
    final String? description,
    final Map<String, dynamic>? geolocationData,
    final Map<String, dynamic>? metaData,
    final DateTime? deletedAt,
    final int? createdBy,
    final int? parentId,
    final int? todoId,
    final DateTime? lastTrendUpdate,
    final DateTime? lastUsedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _TagsModel;

  /// Doc Required
  factory TagsModel.fromJson(final Map<String, dynamic> json) =>
      _$TagsModelFromJson(json);
}
