import 'package:flutter/material.dart';
import 'package:project_ephesto/page/register_car.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  CarState createState() {
    return CarState();
  }
}

// Implements load all cars
class CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
            Text("data")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const RegisterCar();
          }));
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }

}
