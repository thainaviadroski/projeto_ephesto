import 'package:flutter/material.dart';

class RegisterCar extends StatefulWidget {
  const RegisterCar({super.key});

  @override
  RegisterCarState createState() {
    return RegisterCarState();
  }
}

class RegisterCarState extends State<RegisterCar> {
  String placa = "";
  String marca = "";
  String modelo = "";
  int ano = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar carro"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              tffMarca(),
              tffModelo(),
              tffPlaca(),
              tffAno(),
              btnSave(marca, modelo, placa, ano)
            ],
          )),
    );
  }

  TextFormField tffMarca() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatorio';
        }
        return null;
      },
      onChanged: (value) => setState(() {
        marca = value;
      }),
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), label: Text("Marca")),
    );
  }

  TextFormField tffModelo() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatorio';
        }
        return null;
      },
      onChanged: (value) => setState(() {
        modelo = value;
      }),
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), label: Text("Modelo")),
    );
  }

  TextFormField tffPlaca() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatorio';
        }
        return null;
      },
      onChanged: (value) => setState(() {
        placa = value;
      }),
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("Placa"),
      ),
    );
  }

  TextFormField tffAno() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatorio';
        }
        return null;
      },
      onChanged: (value) => setState(() {
        placa = value;
      }),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("Ano"),
      ),
    );
  }

  ElevatedButton btnSave(String marca, String modelo, String placa, int ano) {
    return ElevatedButton(onPressed: () {
      // Implements logic for save new car
    }, child: const Text("Salvar", style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20
    )),);
  }
}
