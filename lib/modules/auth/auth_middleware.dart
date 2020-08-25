import 'dart:convert';

import 'package:flutter_parse_chat/app_state.dart';
import 'package:flutter_parse_chat/modules/auth/auth_actions.dart';
import 'package:flutter_parse_chat/modules/auth/models/session_data.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAuthMiddleware() {
  return [
    TypedMiddleware<AppState, LoginAction>(_login()),
  ];
}

Middleware<AppState> _login() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    final Response response = await get('http://10.0.2.2:8080/auth/login');
    final SessionData sessionData = SessionData.fromJson(response.body);
    store.dispatch(SaveAuthTokenAction(sessionData.token));
    next(action);
  };
}
