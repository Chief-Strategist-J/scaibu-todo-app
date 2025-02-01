import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

/// Doc Required
@freezed
class PostEntity with _$PostEntity {
  /// Doc Required
  const factory PostEntity({
    required final int id,
    required final String title,
    required final String slug,
    required final int userId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final String? content,
    @Default('draft') final String status,
    final Map<String, dynamic>? metadata,
    final String? metadataAuthor,
    final String? metadataCategory,
    final DateTime? publishedAt,
    final DateTime? deletedAt,
  }) = _PostEntity;

  /// Doc Required
  factory PostEntity.fromJson(final Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
