import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parse_chat/app_state_middleware.dart';
import 'package:flutter_parse_chat/app_state_reducer.dart';
import 'package:flutter_parse_chat/environment.dart';
import 'package:flutter_parse_chat/modules/auth/repositories/auth_graphql_repository.dart';
import 'package:flutter_parse_chat/modules/auth/repositories/auth_repository.dart';
import 'package:redux/redux.dart';

import './app.dart';
import './app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AuthRepository authRepository = AuthGraphqlRepository(baseUrl);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: AppState(),
    middleware: createAppMiddleware(authRepository),
  );
  runApp(App(store));
}
