import 'dart:convert';

class LoginData {
  final String email;
  final String password;

  const LoginData({
    this.email,
    this.password,
  });

  LoginData copyWith({
    String email,
    String password,
  }) {
    return LoginData(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginData(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginData.fromJson(String source) =>
      LoginData.fromMap(json.decode(source));

  @override
  String toString() => 'LoginData(email: $email, password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginData && o.email == email && o.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
