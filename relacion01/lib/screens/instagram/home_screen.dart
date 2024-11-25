import 'package:flutter/material.dart';
import '../screens.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("alvarezdelvayo"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: const Column(
        children: [
          ParteAlta(),
          ParteMediaAlta(),
          ParteMediaBaja(),
          Footer(),
        ],
      ),
    );
  }
}
