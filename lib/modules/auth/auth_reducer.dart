import 'package:flutter_parse_chat/modules/auth/auth_actions.dart';
import 'package:redux/redux.dart';

import 'models/auth_state.dart';

final AuthState Function(AuthState, dynamic) authReducer =
    combineReducers<AuthState>([
  TypedReducer<AuthState, LoginAction>(_login),
  TypedReducer<AuthState, SaveAuthTokenAction>(_saveAuthToken),
]);

AuthState _login(AuthState state, LoginAction action) {
  return state;
}

AuthState _saveAuthToken(AuthState state, SaveAuthTokenAction action) {
  return state.copyWith(authToken: action.authToken);
}
