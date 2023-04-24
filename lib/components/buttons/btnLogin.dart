import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget btnLogin() {
  return Padding(
    padding: EdgeInsets.all(2),
    child: ElevatedButton(onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Logar",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        )),
  );
}
