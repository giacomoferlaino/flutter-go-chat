import 'package:flutter_parse_chat/app_state.dart';
import 'package:flutter_parse_chat/modules/auth/auth_middleware.dart';
import 'package:flutter_parse_chat/modules/auth/repositories/auth_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAppMiddleware(AuthRepository authRepository) {
  return [
    ...createAuthMiddleware(authRepository),
  ];
}
