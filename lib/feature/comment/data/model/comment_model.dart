import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

mixin CommentEntityMixin {
  int get id;

  String get content;

  String get status;

  Map<String, dynamic>? get metadata;

  String? get metadataApprovedBy;

  DateTime? get approvedAt;

  int get postId;

  int get userId;

  DateTime get createdAt;

  DateTime get updatedAt;

  DateTime? get deletedAt;
}

@freezed
class CommentModel with _$CommentModel, CommentEntityMixin {
  const factory CommentModel({
    required final int id,
    required final content,
    @JsonKey(name: 'post_id') required final int postId,
    @JsonKey(name: 'user_id') required final int userId,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @Default('pending') final String status,
    final Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_approved_by') final String? metadataApprovedBy,
    final DateTime? approvedAt,
    @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(final Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
