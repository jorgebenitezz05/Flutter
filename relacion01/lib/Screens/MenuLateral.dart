import 'package:flutter/material.dart';
import 'Ejercicio1.dart';
import 'Ejercicio2.dart';
import 'Ejercicio3.dart';
import 'Ejercicio4.dart';

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
                    image: NetworkImage(
                        "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                    fit: BoxFit.cover)),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Ejercicio1()));
              },
            ),
          ),
          ListTile(
            title: const Text("Ejercicio 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio2()));
            },
          ),
                    ListTile(
            title: const Text("Ejercicio 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio3()));
            },
          ),
                    ListTile(
            title: const Text("Ejercicio 4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio4()));
            },
          ),
        ],
      ),
    );
  }
}
