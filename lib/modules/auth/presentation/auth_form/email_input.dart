import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  static const String _label = 'E-mail address';
  final Key key;
  final void Function(String value) onSaved;

  EmailInput({
    this.key,
    @required this.onSaved,
  });

  String validateEmail(String value) {
    if (value.isEmpty) {
      return '$_label is required';
    }
    final RegExp exp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!exp.hasMatch(value)) {
      return 'Invalid ${_label.toLowerCase()} format';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: _label),
      onSaved: onSaved,
    );
  }
}
