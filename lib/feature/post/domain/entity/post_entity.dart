import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required int id,
    required String title,
    String? content,
    @Default('draft') String status,
    required String slug,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_author') String? metadataAuthor,
    @JsonKey(name: 'metadata_category') String? metadataCategory,
    DateTime? publishedAt,
    required int userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) => _$PostEntityFromJson(json);
}
