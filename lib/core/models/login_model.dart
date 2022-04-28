class AllUsersModel {
  final List<UserModel> users;

  const AllUsersModel({
    required this.users,
  });

  factory AllUsersModel.fromJson(Map<String, dynamic> json) {
    return AllUsersModel(
      users:
          List.from(json['users']).map((e) => UserModel.fromJson(e)).toList(),
    );
  }
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
  });

  late final String id;
  late final String name;
  late final String email;
  late final String avatar;
  late final String phone;
  late final bool blocked;
  late final List<Book> booksBorrows;
  late final List<Book> booksSaved;
  late final List<Book> returnedBooks;

  UserModel.fromJson(Map<String, dynamic> json) {
    booksBorrows = List.from(json['booksBorrows']).map((e) => Book.fromJson(e)).toList();
    booksSaved = List.from(json['booksSaved']).map((e) => Book.fromJson(e)).toList();
    returnedBooks = List.from(json['returnedBooks']).map((e) => Book.fromJson(e)).toList();
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    avatar = json['avatar'] ?? '';
    phone = json['phone'] ?? '';
    blocked = json['blocked'] ?? false;
  }
}

class Book {
  late final String id;

  Book.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
  }
}
