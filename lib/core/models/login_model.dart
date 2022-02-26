class LoginModel {
  String? token;
  bool? status;
  String? message;
  UserModel? user;

  LoginModel({
    required this.token,
    required this.status,
    required this.message,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'] ?? '',
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      user: UserModel.fromJson(json['user'] ?? 'empty'),
    );
  }
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  late final String id;
  late final String name;
  late final String email;
  late final String avatar;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    avatar = json['avatar'] ?? '';
  }
}
