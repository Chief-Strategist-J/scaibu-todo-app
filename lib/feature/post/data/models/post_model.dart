import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

/// Doc Required
mixin PostEntityMixin {
  /// Doc Required
  int get id;

  /// Doc Required
  String get title;

  /// Doc Required
  String? get content;

  /// Doc Required
  String get status;

  /// Doc Required
  String get slug;

  /// Doc Required
  Map<String, dynamic>? get metadata;

  /// Doc Required
  String? get metadataAuthor;

  /// Doc Required
  String? get metadataCategory;

  /// Doc Required
  DateTime? get publishedAt;

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
class PostModel with _$PostModel, PostEntityMixin {
  /// Doc Required
  const factory PostModel({
    required final int id,
    required final String title,
    required final int userId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    required final String slug,
    final String? content,
    @Default('draft') final String status,
    final Map<String, dynamic>? metadata,
    final String? metadataAuthor,
    final String? metadataCategory,
    final DateTime? publishedAt,
    final DateTime? deletedAt,
  }) = _PostModel;

  /// Doc Required
  factory PostModel.fromJson(final Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
