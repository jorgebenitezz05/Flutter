import 'package:flutter/material.dart';

class Ejercicio6 extends StatelessWidget {
  const Ejercicio6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 6"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image.asset(
              "assets/images/coche.jpeg",
              width: 100,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Image.asset(
                  "assets/images/foto1.jpg",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 10), 
                Image.asset(
                  "assets/images/foto2.jpg",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Image.asset(
                  "assets/images/foto3.jpg",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 10), 
                Image.asset(
                  "assets/images/foto4.jpg",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 10), 
                Image.asset(
                  "assets/images/foto5.jpeg",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
