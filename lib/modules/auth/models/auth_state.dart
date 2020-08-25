import 'dart:convert';

class AuthState {
  final String authToken;

  const AuthState({
    this.authToken,
  });

  AuthState copyWith({
    String authToken,
  }) {
    return AuthState(
      authToken: authToken ?? this.authToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authToken': authToken,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthState(
      authToken: map['authToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source));

  @override
  String toString() => 'Auth(authToken: $authToken)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthState && o.authToken == authToken;
  }

  @override
  int get hashCode => authToken.hashCode;
}
