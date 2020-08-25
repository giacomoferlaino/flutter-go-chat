import 'dart:convert';

import 'package:meta/meta.dart';

import 'modules/auth/models/auth_state.dart';

@immutable
class AppState {
  final bool isLoading;
  final AuthState auth;

  AppState({
    this.isLoading = false,
    this.auth = const AuthState(),
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    AuthState auth,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      auth: auth ?? this.auth,
    );
  }

  @override
  int get hashCode => isLoading.hashCode ^ auth.hashCode;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppState && o.isLoading == isLoading && o.auth == auth;
  }

  @override
  String toString() => 'AppState(isLoading: $isLoading, auth: $auth)';

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'auth': auth?.toMap(),
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppState(
      isLoading: map['isLoading'],
      auth: AuthState.fromMap(map['auth']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source));
}
