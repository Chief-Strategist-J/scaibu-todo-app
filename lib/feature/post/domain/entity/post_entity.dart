import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required final int id,
    required final String title,
    final String? content,
    @Default('draft') final String status,
    required final String slug,
    final Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_author') final String? metadataAuthor,
    @JsonKey(name: 'metadata_category') final String? metadataCategory,
    final DateTime? publishedAt,
    required final int userId,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
  }) = _PostEntity;

  factory PostEntity.fromJson(final Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
