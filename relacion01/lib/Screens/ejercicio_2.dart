import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 2"),
      ),
      body: Center(
        child: Row(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/coche.jpeg",
              width: 100,
              height: 100,
            ),
            Image.asset(
              "assets/images/coche.jpeg",
              width: 100,
              height: 100,
            ),
            Image.asset(
              "assets/images/coche.jpeg",
              width: 100,
              height: 100,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
