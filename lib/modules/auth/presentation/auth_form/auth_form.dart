import 'package:flutter/material.dart';

import '../auth_form/email_input.dart';
import '../auth_form/login_button.dart';
import '../auth_form/mode_switch_button.dart';
import '../auth_form/password_input.dart';
import '../auth_form/username_input.dart';

class AuthForm extends StatefulWidget {
  final Size deviceSize;
  final void Function() onLogin;

  AuthForm(this.deviceSize, {@required this.onLogin});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  static const Key _emailKey = const ValueKey('email');
  static const Key _usernameKey = const ValueKey('username');
  static const Key _passwordKey = const ValueKey('password');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  bool _isLoading = false;

  void Function() get onLogin => widget.onLogin;

  void _submit() {
    final bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      onLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all((widget.deviceSize.width * 0.10)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(widget.deviceSize.width * 0.04),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailInput(
                key: _emailKey,
                onSaved: (_) {},
              ),
              if (!_isLogin)
                UsernameInput(
                  key: _usernameKey,
                  onSaved: (_) {},
                ),
              PasswordInput(
                key: _passwordKey,
                onSaved: (_) {},
              ),
              SizedBox(height: 12),
              if (_isLoading) CircularProgressIndicator(),
              if (!_isLoading)
                LoginButton(
                  isLogin: _isLogin,
                  onPressed: _submit,
                ),
              if (!_isLoading)
                ModeSwitchButton(
                  isLogin: _isLogin,
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
