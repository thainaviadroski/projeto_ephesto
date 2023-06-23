// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';


import '../dao/UserDao.dart';
import '../entity/UserEntity.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  RegisterState createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  String name = '';
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Usuario"),
      ),
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              frmText(),
              frmEmail(),
              frmPassword(),
              btnRegister(name, email, pass)
            ],
          )),
    ));
  }

  TextFormField frmText() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo nome é obrigatório';
        }
      },
      onChanged: (value) => setState(() {
        name = value;
      }),
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), label: Text("Nome completo")),
    );
  }

  TextFormField frmEmail() {
    return TextFormField(
      validator: (value) {
        if (value!.contains(RegExp(r'[@.]'), 1)) {
          return 'Invalido';
        }
        // ignore: unnecessary_null_comparison
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

  ElevatedButton btnRegister(String nome, String email, String pass) {
    return ElevatedButton(
      onPressed: () async {
        UserEntity user = UserEntity();
        user.email = email;
        user.nomeCompleto = nome;
        user.senha = pass;
        int id = await UserEntityDao().insertUser(user);

        // ignore: avoid_print
        print(id);
      },
      child: const Text("Cadastre-se"),
    );
  }
}
