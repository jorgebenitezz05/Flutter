import 'package:flutter/material.dart';
import 'footer.dart';
import 'parte_alta.dart';
import 'parte_media_alta.dart';
import 'parte_media_baja.dart';

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: const [
            Icon(Icons.menu),
          ],
        ),
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
