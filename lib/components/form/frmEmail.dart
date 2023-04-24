import 'package:flutter/material.dart';

Widget frmEmail() {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("E-mail"),
      ));
}
