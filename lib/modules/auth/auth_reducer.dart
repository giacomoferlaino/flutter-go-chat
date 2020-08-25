import 'package:flutter_parse_chat/modules/auth/auth_actions.dart';
import 'package:redux/redux.dart';

import './models/auth.dart';

final Auth Function(Auth, dynamic) authReducer = combineReducers<Auth>([
  TypedReducer<Auth, LoginAction>(_login),
]);

Auth _login(Auth state, LoginAction action) {
  return state.copyWith(isAuthenticated: true);
}
