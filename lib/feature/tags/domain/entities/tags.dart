class TagEntity {
  final int? id;
  final String? uuid;
  final bool? isActive;
  final int? order;
  final int? version;
  final int? followerCount;
  final int? usageCount;
  final int? relatedPostsCount;
  final int? userInteractionCount;
  final double? popularityScore;
  final String? name;
  final String? slug;
  final String? metaTitle;
  final String? color;
  final String? imageUrl;
  final String? tagType;
  final String? contentType;
  final String? descriptionVector;
  final String? metaDescription;
  final String? description;
  final Map<String, dynamic>? geolocationData;
  final Map<String, dynamic>? metaData;
  final DateTime? deletedAt; // For soft delete
  final int? createdBy;
  final int? parentId;
  final int? todoId;
  final DateTime? lastTrendUpdate;
  final DateTime? lastUsedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TagEntity({
    this.id,
    this.uuid,
    this.isActive,
    this.order,
    this.version,
    this.followerCount,
    this.usageCount,
    this.relatedPostsCount,
    this.userInteractionCount,
    this.popularityScore,
    this.name,
    this.slug,
    this.metaTitle,
    this.color,
    this.imageUrl,
    this.tagType,
    this.contentType,
    this.descriptionVector,
    this.metaDescription,
    this.description,
    this.geolocationData,
    this.metaData,
    this.deletedAt,
    this.createdBy,
    this.parentId,
    this.todoId,
    this.lastTrendUpdate,
    this.lastUsedAt,
    this.createdAt,
    this.updatedAt,
  });

  TagEntity copyWith({
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
  }) {
    return TagEntity(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      isActive: isActive ?? this.isActive,
      order: order ?? this.order,
      version: version ?? this.version,
      followerCount: followerCount ?? this.followerCount,
      usageCount: usageCount ?? this.usageCount,
      relatedPostsCount: relatedPostsCount ?? this.relatedPostsCount,
      userInteractionCount: userInteractionCount ?? this.userInteractionCount,
      popularityScore: popularityScore ?? this.popularityScore,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      metaTitle: metaTitle ?? this.metaTitle,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
      tagType: tagType ?? this.tagType,
      contentType: contentType ?? this.contentType,
      descriptionVector: descriptionVector ?? this.descriptionVector,
      metaDescription: metaDescription ?? this.metaDescription,
      description: description ?? this.description,
      geolocationData: geolocationData ?? this.geolocationData,
      metaData: metaData ?? this.metaData,
      deletedAt: deletedAt ?? this.deletedAt,
      createdBy: createdBy ?? this.createdBy,
      parentId: parentId ?? this.parentId,
      todoId: todoId ?? this.todoId,
      lastTrendUpdate: lastTrendUpdate ?? this.lastTrendUpdate,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TagEntity &&
        other.id == id &&
        other.uuid == uuid &&
        other.isActive == isActive &&
        other.order == order &&
        other.version == version &&
        other.followerCount == followerCount &&
        other.usageCount == usageCount &&
        other.relatedPostsCount == relatedPostsCount &&
        other.userInteractionCount == userInteractionCount &&
        other.popularityScore == popularityScore &&
        other.name == name &&
        other.slug == slug &&
        other.metaTitle == metaTitle &&
        other.color == color &&
        other.imageUrl == imageUrl &&
        other.tagType == tagType &&
        other.contentType == contentType &&
        other.descriptionVector == descriptionVector &&
        other.metaDescription == metaDescription &&
        other.description == description &&
        other.geolocationData == geolocationData &&
        other.metaData == metaData &&
        other.deletedAt == deletedAt &&
        other.createdBy == createdBy &&
        other.parentId == parentId &&
        other.todoId == todoId &&
        other.lastTrendUpdate == lastTrendUpdate &&
        other.lastUsedAt == lastUsedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        isActive.hashCode ^
        order.hashCode ^
        version.hashCode ^
        followerCount.hashCode ^
        usageCount.hashCode ^
        relatedPostsCount.hashCode ^
        userInteractionCount.hashCode ^
        popularityScore.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        metaTitle.hashCode ^
        color.hashCode ^
        imageUrl.hashCode ^
        tagType.hashCode ^
        contentType.hashCode ^
        descriptionVector.hashCode ^
        metaDescription.hashCode ^
        description.hashCode ^
        geolocationData.hashCode ^
        metaData.hashCode ^
        deletedAt.hashCode ^
        createdBy.hashCode ^
        parentId.hashCode ^
        todoId.hashCode ^
        lastTrendUpdate.hashCode ^
        lastUsedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
