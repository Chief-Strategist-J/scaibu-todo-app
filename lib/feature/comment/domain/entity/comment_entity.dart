import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_entity.freezed.dart';
part 'comment_entity.g.dart';

@freezed
class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    required int id,
    required String content,
    @Default('pending') String status,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_approved_by') String? metadataApprovedBy,
    DateTime? approvedAt,
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(Map<String, dynamic> json) => _$CommentEntityFromJson(json);
}
