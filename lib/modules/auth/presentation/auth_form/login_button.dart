import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  static const String _loginLabel = 'Login';
  static const String _signupLabel = 'Signup';
  final bool isLogin;
  final void Function() onPressed;

  LoginButton({
    this.isLogin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(isLogin ? _loginLabel : _signupLabel),
      onPressed: onPressed,
    );
  }
}
