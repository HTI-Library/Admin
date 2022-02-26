class Author {
  late final String id;
  late final String authorName;

  Author.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    authorName = json['autherName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['autherName'] = authorName;
    return _data;
  }
}