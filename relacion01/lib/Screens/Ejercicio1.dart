import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 1"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Jorge Benítez Lladó",
              style: GoogleFonts.amethysta(
                textStyle: const TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 20), 
            Text(
              "Repositorio GitHub: https://github.com/jorgebenitezz05/Flutter.git",
              style: GoogleFonts.amethysta(
                textStyle: const TextStyle(fontSize: 18.0),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
