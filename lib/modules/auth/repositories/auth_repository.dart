import 'package:flutter_parse_chat/modules/auth/models/login_data.dart';
import 'package:flutter_parse_chat/modules/auth/models/session_data.dart';

abstract class AuthRepository {
  Future<SessionData> login(LoginData loginData);
}
