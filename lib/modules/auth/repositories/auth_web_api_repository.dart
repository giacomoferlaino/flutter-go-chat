import 'package:flutter_parse_chat/models/url.dart';
import 'package:flutter_parse_chat/modules/auth/models/login_data.dart';
import 'package:flutter_parse_chat/modules/auth/models/session_data.dart';
import 'package:flutter_parse_chat/modules/auth/repositories/auth_repository.dart';
import 'package:http/http.dart';

class AuthWebApiRepository implements AuthRepository {
  static const String relativePath = '/auth';
  static const String loginPath = '/login';
  final Url baseUrl;

  const AuthWebApiRepository(this.baseUrl);

  @override
  Future<SessionData> login(LoginData loginData) async {
    final Uri uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      port: baseUrl.port,
      pathSegments: [relativePath, loginPath],
    );
    final Response response = await get(uri.toString());
    return SessionData.fromJson(response.body);
  }
}
