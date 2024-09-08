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
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
