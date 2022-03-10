class GetAllLibraryModel {
  final List<LibraryModel> libraries;
  final num allLibraries;

  const GetAllLibraryModel({
    required this.libraries,
    required this.allLibraries,
  });

  factory GetAllLibraryModel.fromJson(Map<String, dynamic> json) {
    return GetAllLibraryModel(
      libraries: List.from(json['libraries'])
          .map((e) => LibraryModel.fromJson(e))
          .toList(),
      allLibraries: json['allLibraries'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'libraries': libraries,
      'allLibraries': allLibraries,
    };
  }
}

class LibraryModel {
  late final String id;
  late final String name;
  late final String code;
  late final String createdAt;
  late final String updatedAt;
  late final num __v;

  LibraryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    code = json['code'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    return _data;
  }
}
