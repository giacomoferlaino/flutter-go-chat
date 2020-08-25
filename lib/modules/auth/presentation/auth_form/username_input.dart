import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  static const String _label = 'Username';
  static const int _usernameMinLength = 4;
  final Key key;
  final void Function(String value) onSaved;

  UsernameInput({
    this.key,
    @required this.onSaved,
  });

  String validateUsername(String value) {
    if (value.isEmpty) {
      return '$_label is required.';
    }
    if (value.length < _usernameMinLength) {
      return '$_label has to be at least $_usernameMinLength characters long.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: validateUsername,
      decoration: const InputDecoration(labelText: _label),
      onSaved: onSaved,
    );
  }
}
