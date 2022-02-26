class CategoriesModel {
  final num allCategories;
  final List<CategoryModel> categories;

  const CategoriesModel({
    required this.allCategories,
    required this.categories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      allCategories: json['allCategories'],
      categories: List.from(json['categories'])
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allCategories': allCategories,
      'categories': categories,
    };
  }
}

class CategoryModel {
  late final String id;
  late final String name;
  late final String image;
  late final String createdAt;
  late final String updatedAt;
  late final int __v;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    // createdAt = json['createdAt'] ?? '';
    // updatedAt = json['updatedAt'] ?? '';
    // __v = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = __v;
    return _data;
  }
}
