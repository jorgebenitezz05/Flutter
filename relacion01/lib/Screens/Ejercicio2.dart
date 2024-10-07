import 'package:flutter/material.dart';


class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pantalla"),
      ),
      body: const Center(
        child: Text("Parte central"),
      ),
    );
  }
}
