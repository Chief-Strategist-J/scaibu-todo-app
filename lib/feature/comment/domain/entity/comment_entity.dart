import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_entity.freezed.dart';
part 'comment_entity.g.dart';

@freezed
class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    required final int id,
    required final String content,
    @Default('pending') final String status,
    final Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_approved_by') final String? metadataApprovedBy,
    final DateTime? approvedAt,
    @JsonKey(name: 'post_id') required final int postId,
    @JsonKey(name: 'user_id') required final int userId,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(final Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
}
