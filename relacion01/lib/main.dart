import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      theme: ThemeData(
        primaryColor: Colors.teal[300],
        scaffoldBackgroundColor: Colors.teal[50],

        // Colores de texto en el tema claro
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
          displaySmall: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black),
          labelLarge: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),

        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),

        // Personalización de los ElevatedButton para un tema claro
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal[300],
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
