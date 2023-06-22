import 'package:flutter/material.dart';
import 'package:project_ephesto/page/car.dart';

Widget btnLogin(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Car();
          }));
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Logar",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )),
  );
}
