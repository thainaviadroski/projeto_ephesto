import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ephesto/page/register.dart';

Widget btnRegister(BuildContext context) {
  return Padding(
      padding: EdgeInsets.all(2),
      child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Register();
            }));
          },
          child: const Text(
            "Cadastre-se",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          )));
}
