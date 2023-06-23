import 'package:flutter/material.dart';
import 'package:project_ephesto/page/register_car.dart';

import '../dao/CarDao.dart';
import '../entity/CarEntity.dart';

class Car extends StatefulWidget {
  final int idUser;

  const Car({Key? key, required this.idUser}) : super(key: key);

  @override
  CarState createState() {
    // ignore: no_logic_in_create_state
    return CarState(idUser);
  }
}

class CarState extends State<Car> {
  late List<CarEntity> cars = List.empty();
  late final int idUser;

  CarState(this.idUser);

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  Future<void> loadCars() async {
    //cars = await CarEntityDao().getCarsByUserId(idUser);
    cars = await CarEntityDao().getAllCars();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(idUser.toString()),
      ),
      body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // número de colunas na grade
            ),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final CarEntity car = cars[index];
              return Card(
                color: Colors.amber,
                shadowColor: Colors.black12,
                child: ListTile(
                  title: Text(car.marca ?? ''),
                  subtitle: Text(car.modelo ?? ''),
                  trailing: Text(car.ano?.toString() ?? ''),
                ),
              );
            },
          )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const RegisterCar();
            }),
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
