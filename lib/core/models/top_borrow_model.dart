class TopBorrowModel {
  final List<SimpleBook> books;
  final num allBooks;

  const TopBorrowModel({
    required this.books,
    required this.allBooks,
  });

  factory TopBorrowModel.fromJson(Map<String, dynamic> json) {
    return TopBorrowModel(
      books:
      List.from(json['books']).map((e) => SimpleBook.fromJson(e)).toList(),
      allBooks: json['allBooks'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'books': books,
      'allBooks': allBooks,
    };
  }
}

class SimpleBook {
  late final String id;
  late final String name;
  late final int amount;
  late final String overview;
  late final String authors;

  late final int rate;
  late final String edition;
  late final int pages;
  late final String category;
  late final int topBorrow;
  late final String bookImage;
  late final String bookLink;
  late final String createdAt;
  late final String updatedAt;
  late final int __v;

  SimpleBook.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    amount = json['amount'] ?? 0;
    // overview = json['overview'] ?? '';
    authors = json['auther'] ?? '';
    rate = json['rate'] ?? 0;
    edition = json['edition'] ?? '';
    pages = json['pages'] ?? 0;
    // category = json['category'] ?? '';
    // topBorrow = json['top_Borrow'] ?? 0;
    bookImage = json['bookImage'] ?? '';
    // bookLink = json['bookLink'] ?? '';
    // createdAt = json['createdAt'] ?? '';
    // updatedAt = json['updatedAt'] ?? '';
    // __v = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['amount'] = amount;
    _data['overview'] = overview;

    _data['rate'] = rate;
    _data['edition'] = edition;
    _data['pages'] = pages;
    _data['category'] = category;
    _data['top_Borrow'] = topBorrow;
    _data['bookImage'] = bookImage;
    _data['bookLink'] = bookLink;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = __v;
    return _data;
  }
}
