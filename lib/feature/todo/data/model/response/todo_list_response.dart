class TodoListResponse {
  TodoListResponse({
    this.id,
    this.title,
    this.description,
    this.notes,
  });

  TodoListResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    notes = json['notes'];
  }
  num? id;
  String? title;
  String? description;
  String? notes;
  TodoListResponse copyWith({
    num? id,
    String? title,
    String? description,
    String? notes,
  }) =>
      TodoListResponse(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        notes: notes ?? this.notes,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['notes'] = notes;
    return map;
  }
}
