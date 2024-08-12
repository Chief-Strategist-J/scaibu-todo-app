class ListOfTagsSeededTagResponse {
  ListOfTagsSeededTagResponse({
    String? message,
    bool? status,
    List<TagData>? data,
  }) {
    _message = message;
    _status = status;
    _data = data;
  }

  ListOfTagsSeededTagResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TagData.fromJson(v));
      });
    }
  }

  String? _message;
  bool? _status;
  List<TagData>? _data;

  ListOfTagsSeededTagResponse copyWith({
    String? message,
    bool? status,
    List<TagData>? data,
  }) =>
      ListOfTagsSeededTagResponse(
        message: message ?? _message,
        status: status ?? _status,
        data: data ?? _data,
      );

  String? get message => _message;

  bool? get status => _status;

  List<TagData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TagData {
  TagData({
    num? id,
    String? name,
    String? slug,
    num? createdBy,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _createdBy = createdBy;
  }

  TagData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _createdBy = json['created_by'];
  }

  num? _id;
  String? _name;
  String? _slug;
  num? _createdBy;

  TagData copyWith({
    num? id,
    String? name,
    String? slug,
    num? createdBy,
  }) =>
      TagData(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        createdBy: createdBy ?? _createdBy,
      );

  num? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  num? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['created_by'] = _createdBy;
    return map;
  }
}
