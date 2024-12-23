import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'screens.dart';

class Ejercicio9 extends StatefulWidget {
  const Ejercicio9({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomColors createState() => _RandomColors();
}

class _RandomColors extends State<Ejercicio9> {
  int puntos = 0;
  late Image randomImage;
  late String currentImagePath;
  final List<String> images = [
    "./assets/images/foto1.jpg",
    "./assets/images/foto8.jpg",
    "./assets/images/foto3.jpg",
    "./assets/images/foto9.png",
    "./assets/images/foto5.jpeg",
    "./assets/images/foto6.jpg",
  ];
  bool pulsado = false;
  double xPos = 0;
  double yPos = 0;

  // Variable para almacenar el último mensaje mostrado
  String lastMessage = '';

  @override
  void initState() {
    super.initState();
    getRandomImage();
    timer();
  }

  void timer() {
    Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (!pulsado) {
        reducePuntos();
        checkSnackBar();
      }
      pulsado = false;
      getRandomImage();
      setRandomPosition();
      setState(() {});
    });
  }

  // Metodo para posicion aleatoria
  void setRandomPosition() {
    double maxWidth = MediaQuery.of(context).size.width - 120;
    double maxHeight = MediaQuery.of(context).size.height - 270;

    Random random = Random();
    xPos = random.nextDouble() * maxWidth;
    yPos = random.nextDouble() * maxHeight + 100;
  }

  @override
  Widget build(BuildContext context) {
    if (xPos == 0 && yPos == 0) {
      setRandomPosition();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jorge Benítez"),
      ),
      drawer: const Drawer(
        child: MenuLateral(),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Puntos: $puntos',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: yPos,
            left: xPos,
            child: GestureDetector(
              onTap: () {
                onGiftTap();
              },
              child: randomImage,
            ),
          ),
        ],
      ),
    );
  }

  // Metodo para obtener una imagen random
  void getRandomImage() {
    Random random = Random();
    int randomNumber = random.nextInt(images.length);
    currentImagePath = images[randomNumber];
    randomImage = Image.asset(currentImagePath, width: 120, height: 120);
  }

  // Metodo para sumar puntos cuando se pulse
  void onGiftTap() {
    if (!pulsado) {
      puntos++;
      pulsado = true;
      setState(() {});
      checkSnackBar();
    }
  }

  // Metodo para reducir los puntos
  void reducePuntos() {
    puntos -= 2;
    setState(() {});
  }

  // Metodo para mostrar el SnackBar dependiendo de los puntos
  void checkSnackBar() {
    String message = '';

    // Determinar el mensaje adecuado
    if (puntos == 10) {
      message = '¡Sigue así!';
    } else if (puntos == 20) {
      message = '¡Eres un experto!';
    } else if (puntos <= -10) {
      message = '¡Retírate del juego!, dedicate a otra cosa';
    }

    // Mostrar el mensaje solo si es diferente al último mostrado
    if (message.isNotEmpty && message != lastMessage) {
      showSnackBar(message);
      lastMessage = message;
    }
  }

  // Metodo para mostrar el SnackBar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
