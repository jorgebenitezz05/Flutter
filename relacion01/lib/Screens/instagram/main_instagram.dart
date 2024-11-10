import 'package:flutter/material.dart';
import '../screens.dart';

void main() => runApp(const Instagram());

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("alvarezdelvayo"),
          backgroundColor: Colors.white,
          actions: const [
            Icon(Icons.menu),
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
      ),
    );
  }
}
