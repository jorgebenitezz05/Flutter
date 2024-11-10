import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Relacion 1 y 2',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Relación 1 y 2"),
          ),
          drawer: const MenuLateral(),
          body: const Center(
            child: Text("Parte principal Relación 1 y 2"),
          ),
        ));
  }
}
