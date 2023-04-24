import 'package:flutter/material.dart';
import 'package:project_ephesto/components/buttons/btnForgotMyPassword.dart';
import '../components/buttons/btnRegister.dart';
import '../components/buttons/btnLogin.dart';
import '../components/form/frmEmail.dart';
import '../components/form/frmPassword.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              const Icon(
                Icons.people,
                size: 120,
                color: Colors.blueAccent,
              ),
              frmEmail(),
              frmPassword(),
              btnLogin(),
              btnRegister(context),
              btnForgotMyPassword(context)
            ],
          )),
    ));
  }
}
