import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.home,
            size: 32.0,
            color: Colors.black,
          ),
          const Icon(
            Icons.search,
            size: 32.0,
            color: Colors.black,
          ),
          const Icon(
            Icons.add_box,
            size: 32.0,
            color: Colors.black,
          ),
          const Icon(
            Icons.favorite,
            size: 32.0,
            color: Colors.black,
          ),
          ClipOval(
            child: Image.asset(
              "assets/images/fotoPerfil.jpg",
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
