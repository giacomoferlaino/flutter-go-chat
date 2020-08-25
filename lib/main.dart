import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parse_chat/app_state_middleware.dart';
import 'package:flutter_parse_chat/app_state_reducer.dart';
import 'package:redux/redux.dart';

import './app.dart';
import './app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: AppState(),
    middleware: createAppMiddleware(),
  );
  runApp(App(store));
}
