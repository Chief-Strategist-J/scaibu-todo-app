import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags.freezed.dart';
part 'tags.g.dart';



@freezed
class TagEntity with _$TagEntity {
  const factory TagEntity({
    int? id,
    String? uuid,
    bool? isActive,
    int? order,
    int? version,
    int? followerCount,
    int? usageCount,
    int? relatedPostsCount,
    int? userInteractionCount,
    double? popularityScore,
    String? name,
    String? slug,
    String? metaTitle,
    String? color,
    String? imageUrl,
    String? tagType,
    String? contentType,
    String? descriptionVector,
    String? metaDescription,
    String? description,
    Map<String, dynamic>? geolocationData,
    Map<String, dynamic>? metaData,
    DateTime? deletedAt,
    int? createdBy,
    int? parentId,
    int? todoId,
    DateTime? lastTrendUpdate,
    DateTime? lastUsedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TagEntity;

  factory TagEntity.fromJson(Map<String, dynamic> json) => _$TagEntityFromJson(json);
}
