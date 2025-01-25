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
    final String? metadataApprovedBy,
    final DateTime? approvedAt,
    required final int postId,
    required final int userId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(final Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
}
