class User {
  final String firstName;
  final String lastName;
  final String email;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['lastName'],
    );
  }
}
