import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  static const String _label = 'Password';
  static const int _passMinLength = 6;
  final Key key;
  final void Function(String value) onSaved;

  PasswordInput({
    this.key,
    @required this.onSaved,
  });

  String validatePassword(String value) {
    if (value.isEmpty) {
      return '$_label is required.';
    }
    if (value.length < _passMinLength) {
      return '$_label has to be at least $_passMinLength characters long.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      validator: validatePassword,
      decoration: const InputDecoration(labelText: _label),
      obscureText: true,
      onSaved: onSaved,
    );
  }
}
