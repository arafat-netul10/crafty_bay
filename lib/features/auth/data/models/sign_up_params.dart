class SignUpParams {
  final String name;
  final String email;
  final String mobileNumber;
  final String city;
  final String password;
  final String confirmPassword;

  SignUpParams({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.city,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'city': city,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }


}
