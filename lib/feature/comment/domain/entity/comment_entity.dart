import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_entity.freezed.dart';
part 'comment_entity.g.dart';

/// Doc Required
@freezed
abstract class CommentEntity with _$CommentEntity {
  /// Doc Required
  const factory CommentEntity({
    required final int id,
    required final String content,
    required final int postId,
    required final int userId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    @Default('pending') final String status,
    final Map<String, dynamic>? metadata,
    final String? metadataApprovedBy,
    final DateTime? approvedAt,
    final DateTime? deletedAt,
  }) = _CommentEntity;

  /// Doc Required
  factory CommentEntity.fromJson(final Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
}
