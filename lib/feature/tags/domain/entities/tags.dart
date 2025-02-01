import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags.freezed.dart';
part 'tags.g.dart';


/// Doc Required
@freezed
class TagEntity with _$TagEntity {
  /// Doc Required
  const factory TagEntity({
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
  }) = _TagEntity;

  /// Doc Required
  factory TagEntity.fromJson(final Map<String, dynamic> json) =>
      _$TagEntityFromJson(json);
}
