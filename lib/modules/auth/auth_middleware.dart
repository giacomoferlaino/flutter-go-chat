import 'package:flutter_parse_chat/app_state.dart';
import 'package:flutter_parse_chat/modules/auth/auth_actions.dart';
import 'package:flutter_parse_chat/modules/auth/models/login_data.dart';
import 'package:flutter_parse_chat/modules/auth/models/session_data.dart';
import 'package:flutter_parse_chat/modules/auth/repositories/auth_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAuthMiddleware(AuthRepository authRepository) {
  return [
    TypedMiddleware<AppState, LoginAction>(_login(authRepository)),
  ];
}

Middleware<AppState> _login(AuthRepository authRepository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    final SessionData sessionData = await authRepository.login(
      LoginData(
        email: 'email',
        password: 'password',
      ),
    );
    store.dispatch(SaveAuthTokenAction(sessionData.token));
    next(action);
  };
}
