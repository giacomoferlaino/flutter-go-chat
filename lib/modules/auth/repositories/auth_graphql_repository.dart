import 'package:flutter_parse_chat/models/url.dart';
import 'package:flutter_parse_chat/modules/auth/models/login_data.dart';
import 'package:flutter_parse_chat/modules/auth/models/session_data.dart';
import 'package:flutter_parse_chat/modules/auth/repositories/auth_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthGraphqlRepository implements AuthRepository {
  final Url baseUrl;
  static const String _loginQuery = r'''
    query AuthLogin($email: String!, $password: String!) {
      auth {
        login(email: $email, password: $password) {
          token
          expiresIn
        }
      }
    }
  ''';
  GraphQLClient _client;

  AuthGraphqlRepository(this.baseUrl) {
    final String graphqlUri = '${baseUrl.toString()}graphql';
    final HttpLink _httpLink = HttpLink(uri: graphqlUri);
    _client = GraphQLClient(link: _httpLink, cache: InMemoryCache());
  }

  Future<SessionData> login(LoginData loginData) async {
    final QueryOptions options = QueryOptions(
        documentNode: gql(_loginQuery),
        variables: <String, dynamic>{
          'email': loginData.email,
          'password': loginData.password,
        });
    final QueryResult result = await _client.query(options);
    return SessionData(token: result.data['auth']['login']['token']);
  }
}
