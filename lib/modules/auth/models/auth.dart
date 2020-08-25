import 'dart:convert';

class Auth {
  final bool isAuthenticated;
  const Auth({
    this.isAuthenticated = false,
  });

  Auth copyWith({
    bool isAuthenticated,
  }) {
    return Auth(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isAuthenticated': isAuthenticated,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Auth(
      isAuthenticated: map['isAuthenticated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) => Auth.fromMap(json.decode(source));

  @override
  String toString() => 'Auth(isAuthenticated: $isAuthenticated)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Auth && o.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode => isAuthenticated.hashCode;
}
