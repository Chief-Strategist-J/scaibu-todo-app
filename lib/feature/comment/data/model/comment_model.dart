import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

/// Doc Required
mixin CommentEntityMixin {
  /// Doc Required
  int get id;

  /// Doc Required
  String get content;

  /// Doc Required
  String get status;

  /// Doc Required
  Map<String, dynamic>? get metadata;

  /// Doc Required
  String? get metadataApprovedBy;

  /// Doc Required
  DateTime? get approvedAt;

  /// Doc Required
  int get postId;

  /// Doc Required
  int get userId;

  /// Doc Required
  DateTime get createdAt;

  /// Doc Required
  DateTime get updatedAt;

  /// Doc Required
  DateTime? get deletedAt;
}

/// Doc Required
@freezed
class CommentModel with _$CommentModel, CommentEntityMixin {
  /// Doc Required
  const factory CommentModel({
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
  }) = _CommentModel;

  /// Doc Required
  factory CommentModel.fromJson(final Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
