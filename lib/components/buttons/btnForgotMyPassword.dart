import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget btnForgotMyPassword(BuildContext context) {
  return Padding(
      padding: EdgeInsets.all(2),
      child: TextButton(
          onPressed: () {},
          child: const Text(
            "Esqueci minha senha",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          )));
}
