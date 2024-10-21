import 'package:flutter/material.dart';


import 'screens/MenuLateral.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Relacion 1',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Relación 1"),
          ),
          drawer: const MenuLateral(),
          body: const Center(
            child: Text("Parte principal Relación 1"),
          ),
        ));
  }
}
