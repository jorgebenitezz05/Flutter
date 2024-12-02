import 'package:flutter/material.dart';
import '../screens.dart';

class Ejercicio10 extends StatelessWidget {
  const Ejercicio10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 10"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Text("Instrucciones"),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "El objetivo del juego es acercarse lo más posible a 7.5 sin pasarse. "
                      "Las figuras (Sota, Caballo, Rey) valen 0.5 puntos, y el resto de las cartas valen su número."
                      "\nGana quien primero alcance 5 victorias.",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cerrar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: const Juego7yMedia(),
    );
  }
}