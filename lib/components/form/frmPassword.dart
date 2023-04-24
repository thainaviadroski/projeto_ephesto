import 'package:flutter/material.dart';

Widget frmPassword() {
  return TextFormField(
    obscureText: true,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      label: Text("Senha:"),
    ),
  );
}
