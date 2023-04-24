import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget frmText(String type) {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(border: UnderlineInputBorder(), label: Text(type)),
  );
}
