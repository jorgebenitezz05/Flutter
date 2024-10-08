import 'package:flutter/material.dart';


class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 3"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/coche.jpeg",
               width: 200,
               height: 200,
            ),
            Image.asset(
              "assets/images/coche.jpeg",
               width: 200,
               height: 200,
            ),
            Image.asset(
              "assets/images/coche.jpeg",
               width: 200,
               height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
