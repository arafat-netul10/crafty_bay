class UserModel {
  final String id;
  final String name;
  final String email;
  final String city;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      city: jsonData['city'],
    );

  }
}
