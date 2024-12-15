import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../routes/app_routes.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Jorge Benítez Lladó"),
            accountEmail: Text("jbenlla0402@g.educaand.es"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/foto1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio1);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 2",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio2);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 3",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio3);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 4",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio4);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 5",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio5);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 6",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio6);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 7",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio7);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 8 Instagram",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.instagram);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 9",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio9);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 10 NO DUAL",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio10);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 11",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio11);
              },
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Ejercicio 12 NO DUAL 2",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.ejercicio12);
              },
            ),
          ),
        ],
      ),
    );
  }
}
