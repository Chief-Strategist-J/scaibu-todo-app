import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

mixin PostEntityMixin {
  int get id;

  String get title;

  String? get content;

  String get status;

  String get slug;

  Map<String, dynamic>? get metadata;

  String? get metadataAuthor;

  String? get metadataCategory;

  DateTime? get publishedAt;

  int get userId;

  DateTime get createdAt;

  DateTime get updatedAt;

  DateTime? get deletedAt;
}

@freezed
class PostModel with _$PostModel, PostEntityMixin {
  const factory PostModel({
    required final int id,
    required final String title,
    final String? content,
    @Default('draft') final String status,
    required final String slug,
    final Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_author') final String? metadataAuthor,
    @JsonKey(name: 'metadata_category') final String? metadataCategory,
    final DateTime? publishedAt,
    required final int userId,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
  }) = _PostModel;

  factory PostModel.fromJson(final Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
