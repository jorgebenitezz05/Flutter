import 'package:flutter/material.dart';
import '../screens.dart';

class Ejercicio11 extends StatelessWidget {
  const Ejercicio11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 11"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormularioPersonalizado()),
                );
              },
              child: const Text("Formulario Personalizado"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormularioNumeroAdivinar()),
                );
              },
              child: const Text("Formulario adivina número"),
            ),
          ],
        ),
      ),
    );
  }
}
