import 'package:flutter/material.dart';
import 'package:project_ephesto/components/buttons/btnForgotMyPassword.dart';

import '../components/buttons/btnLogin.dart';
import '../components/buttons/btnRegister.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String email = '';
  String pass = '';

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
              btnLogin(context),
              btnRegister(context),
              btnForgotMyPassword(context)
            ],
          )),
    ));
  }

  TextFormField frmEmail() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo e-mail é obrigatório';
        }
      },
      onChanged: (value) => setState(() {
        email = value;
      }),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), label: Text("E-mail")),
    );
  }

  TextFormField frmPassword() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo senha é obrigatório';
        }
      },
      onChanged: (value) => setState(() {
        pass = value;
      }),
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("Senha"),
      ),
    );
  }
}
