import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../app_state.dart';
import '../presentation/auth_background.dart';
import '../auth_actions.dart';
import '../presentation/auth_form/auth_form.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (_, _ViewModel viewModel) {
        return Scaffold(
          body: Stack(
            children: [
              AuthBackground(),
              Container(
                child: Center(
                  child: AuthForm(
                    deviceSize,
                    onLogin: viewModel.onLogin,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Function() onLogin;

  _ViewModel({this.onLogin});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(onLogin: () {
      store.dispatch(LoginAction());
    });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
