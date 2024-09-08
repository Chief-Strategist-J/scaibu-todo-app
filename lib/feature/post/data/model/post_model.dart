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
    required int id,
    required String title,
    String? content,
    @Default('draft') String status,
    required String slug,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'metadata_author') String? metadataAuthor,
    @JsonKey(name: 'metadata_category') String? metadataCategory,
    DateTime? publishedAt,
    required int userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
