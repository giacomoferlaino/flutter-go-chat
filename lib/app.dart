import 'package:flutter/material.dart';
import 'package:flutter_parse_chat/app_state.dart';
import 'package:flutter_parse_chat/color_palette.dart' as ColorPalette;
import 'package:flutter_parse_chat/modules/auth/auth_selectors.dart';
import 'package:flutter_parse_chat/modules/auth/containers/auth_page.dart';
import 'package:flutter_parse_chat/modules/chat/containers/chats_list_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  App(this.store, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector(
        distinct: true,
        converter: (Store<AppState> store) =>
            isAuthenticatedSelector(store.state.auth),
        builder: (context, isAuthenticated) => MaterialApp(
          title: 'Real Time Chat',
          theme: ThemeData(
            primarySwatch: ColorPalette.primary,
            accentColor: ColorPalette.accent,
            errorColor: ColorPalette.error,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: isAuthenticated ? ChatsListPage() : AuthPage(),
        ),
      ),
    );
  }
}
