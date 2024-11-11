import 'package:flutter/material.dart';

import 'screens.dart';

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 4"),
      ),
      drawer: const MenuLateral(),
      body: const Center(
        child: Column(
          children: [
            Icon(
              Icons.heart_broken,
              size: 120.0,
              color: Colors.cyan,
            ),
            Icon(
              Icons.heart_broken,
              size: 120.0,
              color: Colors.orange,
            ),
            Icon(
              Icons.heart_broken,
              size: 120.0,
              color: Colors.green,
            ),
            Icon(
              Icons.heart_broken,
              size: 120.0,
              color: Colors.red,
            ),
            Icon(
              Icons.heart_broken,
              size: 120.0,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
