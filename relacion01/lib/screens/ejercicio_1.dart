import 'package:flutter/material.dart';

import 'screens.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 1"),
      ),
      drawer: const MenuLateral(),
      body: const Center(
        child: Column(
          children: [
            Spacer(),
            Text(
              "Jorge Benítez Lladó",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Amethysta',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Repositorio GitHub: https://github.com/jorgebenitezz05/Flutter.git",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Amethysta',
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
