import 'auther_model.dart';
import 'book_details_model.dart';
import 'top_borrow_model.dart';

class BorrowModel {
  final num allBooks;
  final List<BorrowDataModel> books;

  const BorrowModel({
    required this.allBooks,
    required this.books,
  });

  factory BorrowModel.fromJson(Map<String, dynamic> json) {
    return BorrowModel(
      allBooks: json['allBooks']??0,
      books: List.from(json['books'])
          .map((e) => BorrowDataModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allBooks': allBooks,
      'books': books,
    };
  }
}

class BorrowDataModel {
  late final String userEmail;
  late final String userName;
  late final String borrowID;
  late final BookDetails book;

  BorrowDataModel.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'] ?? '';
    userName = json['userName'] ?? '';
    borrowID = json['borrowID'] ?? 0;
    book = BookDetails.fromJson(json['book'] ?? '');
  }
}
