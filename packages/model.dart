import 'dart:convert';

List<UserModel> userModelFromJson(String str) {
  final jsonData = json.decode(str) as List<dynamic>;
  return jsonData
      .map<UserModel>(
          (dynamic x) => UserModel.fromJson(x as Map<String, dynamic>))
      .toList();
}

String userModelToJson(List<UserModel> data) =>
    json.encode(data.map((UserModel x) => x.toJson()).toList());

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  int id;
  String name;
  String username;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] as int,
        name: json["name"] as String,
        username: json["username"] as String,
        email: json["email"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
      };
}
