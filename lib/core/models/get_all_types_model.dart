class GetAllTypesModel {
  final List<TypeModel> types;
  final num allTypes;

  const GetAllTypesModel({
    required this.types,
    required this.allTypes,
  });

  factory GetAllTypesModel.fromJson(Map<String, dynamic> json) {
    return GetAllTypesModel(
      types:
          List.from(json['types']).map((e) => TypeModel.fromJson(e)).toList(),
      allTypes: json['allTypes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'types': types,
      'allTypes': allTypes,
    };
  }
}

class TypeModel {
  late final String id;
  late final String name;
  late final String library;
  late final String createdAt;
  late final String updatedAt;
  late final num __v;

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    library = json['library'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['library'] = library;
    return _data;
  }
}
