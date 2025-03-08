import 'package:todo_app/core/app_library.dart';

part 'tags_model.freezed.dart';

part 'tags_model.g.dart';

/// Doc Required
@freezed
abstract class TagsModel with _$TagsModel {
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
