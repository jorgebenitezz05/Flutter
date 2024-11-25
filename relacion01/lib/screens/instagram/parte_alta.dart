import 'package:flutter/material.dart';

class ParteAlta extends StatelessWidget {
  const ParteAlta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/fotoPerfil.jpg",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      "1.026",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amethysta',
                      ),
                    ),
                    Text(
                      "Publicacio...",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Amethysta',
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      "859",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amethysta',
                      ),
                    ),
                    Text(
                      "Seguidores",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Amethysta',
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      "211",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amethysta',
                      ),
                    ),
                    Text(
                      "Seguidos",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Amethysta',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
