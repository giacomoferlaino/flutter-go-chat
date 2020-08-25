import 'package:flutter/material.dart';

class ModeSwitchButton extends StatelessWidget {
  static const String _createAccountLabel = 'Create new account';
  static const String _existingAccountLabel = 'I already have an account';

  final bool isLogin;
  final void Function() onPressed;

  ModeSwitchButton({
    this.isLogin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Theme.of(context).primaryColor,
      child: Text(isLogin ? _createAccountLabel : _existingAccountLabel),
      onPressed: onPressed,
    );
  }
}
