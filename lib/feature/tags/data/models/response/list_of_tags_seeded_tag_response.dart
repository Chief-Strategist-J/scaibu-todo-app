/// Doc Required
class ListOfTagsSeededTagResponse {
  /// Doc Required
  ListOfTagsSeededTagResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  ListOfTagsSeededTagResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String?;
    status = dataMap['status'] as bool?;

    if (dataMap['data'] != null) {
      data = <TagData>[];
      for (final dynamic v in (dataMap['data'] as List<dynamic>)) {
        data?.add(TagData.fromJson(v));
      }
    }
  }

  /// Doc Required
  String? message;

  /// Doc Required
  bool? status;

  /// Doc Required
  List<TagData>? data;

  /// Doc Required
  ListOfTagsSeededTagResponse copyWith({
    final String? message,
    final bool? status,
    final List<TagData>? data,
  }) =>
      ListOfTagsSeededTagResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((final TagData v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Doc Required
class TagData {
  /// Doc Required
  TagData({
    this.id,
    this.name,
    this.slug,
    this.createdBy,
    this.color,
  });

  /// Doc Required
  TagData.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    id = dataMap['id'] as num?;
    name = dataMap['name'] as String?;
    slug = dataMap['slug'] as String?;
    createdBy = dataMap['created_by'] as num?;
    color = dataMap['color'] as String?;
  }

  /// Doc Required
  num? id;

  /// Doc Required
  String? name;

  /// Doc Required
  String? slug;

  /// Doc Required
  num? createdBy;

  /// Doc Required
  String? color;

  /// Doc Required
  TagData copyWith({
    final num? id,
    final String? name,
    final String? slug,
    final num? createdBy,
    final String? color,
  }) =>
      TagData(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        createdBy: createdBy ?? this.createdBy,
        color: color ?? this.color,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['created_by'] = createdBy;
    map['color'] = color;
    return map;
  }
}
