import 'package:flutter/material.dart';
import 'package:project_ephesto/components/buttons/btnForgotMyPassword.dart';
import 'package:project_ephesto/dao/UserDao.dart';

import '../components/buttons/btnRegister.dart';
import '../entity/UserEntity.dart';
import 'car.dart';

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
              btnLogin(email, pass),
              btnRegister(context),
              btnForgotMyPassword(context)
            ],
          )),
    ));
  }

  ElevatedButton btnLogin(String email, String pass) {
    return ElevatedButton(
      onPressed: () async {
        UserEntity? user = await UserEntityDao().login(email, pass);
        if (user != null) {
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Car(idUser: user.id!);
          }));
        }
      },
      child: const Text("Acessar"),
    );
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
