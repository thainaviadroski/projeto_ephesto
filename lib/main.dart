import 'package:flutter/material.dart';
import 'package:project_ephesto/page/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Car",
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      initialRoute: "/splash",
      routes: {
        '/splash': (_) => const Splash(),
      },
    );
  }
}
