import 'package:flutter/material.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Relación 1,2,3 y 4"),
      ),
      drawer: const MenuLateral(),
      body: const Center(
        child: Text("Parte principal Relación 1,2,3 y 4"),
      ),
    );
  }
}
