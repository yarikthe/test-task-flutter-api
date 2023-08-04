
class UserModel {

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserModel({ 
    required this.id, 
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as int, 
    email: json['email'] as String, 
    firstName: json['first_name'] as String, 
    lastName: json['last_name'] as String, 
    avatar: json['avatar'] as String
  );
}