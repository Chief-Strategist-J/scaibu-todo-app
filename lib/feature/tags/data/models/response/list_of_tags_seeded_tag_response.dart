class ListOfTagsSeededTagResponse {
  ListOfTagsSeededTagResponse({
    this.message,
    this.status,
    this.data,
  });

  ListOfTagsSeededTagResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TagData.fromJson(v));
      });
    }
  }

  String? message;
  bool? status;
  List<TagData>? data;

  ListOfTagsSeededTagResponse copyWith({
    String? message,
    bool? status,
    List<TagData>? data,
  }) =>
      ListOfTagsSeededTagResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TagData {
  TagData({
    this.id,
    this.name,
    this.slug,
    this.createdBy,
    this.color,
  });

  TagData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdBy = json['created_by'];
    color = json['color'];
  }

  num? id;
  String? name;
  String? slug;
  num? createdBy;
  String? color;

  TagData copyWith({
    num? id,
    String? name,
    String? slug,
    num? createdBy,
    String? color,
  }) =>
      TagData(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        createdBy: createdBy ?? this.createdBy,
        color: color ?? this.color,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['created_by'] = createdBy;
    map['color'] = color;
    return map;
  }
}
