import 'dart:convert';

class SessionData {
  final String token;
  SessionData({
    this.token,
  });

  SessionData copyWith({
    String token,
  }) {
    return SessionData(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory SessionData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SessionData(
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionData.fromJson(String source) =>
      SessionData.fromMap(json.decode(source));

  @override
  String toString() => 'SessionData(token: $token)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SessionData && o.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
