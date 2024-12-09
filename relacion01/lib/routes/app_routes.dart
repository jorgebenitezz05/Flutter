import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String ejercicio1 = '/ejercicio1';
  static const String ejercicio2 = '/ejercicio2';
  static const String ejercicio3 = '/ejercicio3';
  static const String ejercicio4 = '/ejercicio4';
  static const String ejercicio5 = '/ejercicio5';
  static const String ejercicio6 = '/ejercicio6';
  static const String ejercicio7 = '/ejercicio7';
  static const String instagram = '/instagram';
  static const String ejercicio9 = '/ejercicio9';
  static const String ejercicio10 = '/ejercicio10';
  static const String ejercicio11 = '/ejercicio11';


  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    ejercicio1: (context) => const Ejercicio1(),
    ejercicio2: (context) => const Ejercicio2(),
    ejercicio3: (context) => const Ejercicio3(),
    ejercicio4: (context) => const Ejercicio4(),
    ejercicio5: (context) => const Ejercicio5(),
    ejercicio6: (context) => const Ejercicio6(),
    ejercicio7: (context) => const Ejercicio7(),
    instagram: (context) => const Instagram(),
    ejercicio9: (context) => const Ejercicio9(),
    ejercicio10: (context) => const Ejercicio10(),
    ejercicio11: (context) => const Ejercicio11(),
  };
}
