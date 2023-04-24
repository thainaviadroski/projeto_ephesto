import 'package:flutter/material.dart';
import 'package:project_ephesto/components/form/frmText.dart';
import '../components/buttons/btnForgotMyPassword.dart';
import '../components/buttons/btnLogin.dart';
import '../components/buttons/btnRegister.dart';
import '../components/form/frmDateBorn.dart';
import '../components/form/frmEmail.dart';
import '../components/form/frmPassword.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              frmText("Nome"),
              frmDateBorn(),
              frmEmail(),
              frmPassword()
            ],
          )),
    ));
  }
}
