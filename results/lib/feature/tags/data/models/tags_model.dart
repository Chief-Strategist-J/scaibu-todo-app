import 'package:todo_app/core/app_library.dart';

part 'tags_model.freezed.dart';
part 'tags_model.g.dart';

mixin TagEntityMixin {
  int? get id;
  String? get uuid;
  bool? get isActive;
  int? get order;
  int? get version;
  int? get followerCount;
  int? get usageCount;
  int? get relatedPostsCount;
  int? get userInteractionCount;
  double? get popularityScore;
  String? get name;
  String? get slug;
  String? get metaTitle;
  String? get color;
  String? get imageUrl;
  String? get tagType;
  String? get contentType;
  String? get descriptionVector;
  String? get metaDescription;
  String? get description;
  Map<String, dynamic>? get geolocationData;
  Map<String, dynamic>? get metaData;
  DateTime? get deletedAt;
  int? get createdBy;
  int? get parentId;
  int? get todoId;
  DateTime? get lastTrendUpdate;
  DateTime? get lastUsedAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;
}

@freezed
class TagsModel with _$TagsModel, TagEntityMixin {
  const factory TagsModel({
    int? id,
    String? uuid,
    bool? isActive,
    int? order,
    int? version,
    int? followerCount,
    int? usageCount,
    int? relatedPostsCount,
    int? userInteractionCount,
    double? popularityScore,
    String? name,
    String? slug,
    String? metaTitle,
    String? color,
    String? imageUrl,
    String? tagType,
    String? contentType,
    String? descriptionVector,
    String? metaDescription,
    String? description,
    Map<String, dynamic>? geolocationData,
    Map<String, dynamic>? metaData,
    DateTime? deletedAt,
    int? createdBy,
    int? parentId,
    int? todoId,
    DateTime? lastTrendUpdate,
    DateTime? lastUsedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TagsModel;

  factory TagsModel.fromJson(Map<String, dynamic> json) => _$TagsModelFromJson(json);
}
