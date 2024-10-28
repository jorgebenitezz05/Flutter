import 'package:flutter/material.dart';

class ParteMediaAlta extends StatelessWidget {
  const ParteMediaAlta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fernando Álvarez del Vayo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              '"Nunca sabes lo que te depara el futuro."',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const Text(
              "faqsandroid.com/",
              style: TextStyle(color: Color.fromARGB(255, 12, 116, 201)),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border:
                    Border.all(color: const Color.fromARGB(255, 131, 131, 131)),
              ),
              child: const Center(
                child: Text(
                  "Editar perfil",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.add_circle_outline_rounded,
                      size: 70.0,
                      color: Colors.black,
                    ),
                    Text(
                      "Nuevo",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/foto2.jpg"),
                          ),
                          SizedBox(height: 5),
                          Text("Pilotando"),
                          SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/foto3.jpg"),
                          ),
                          SizedBox(height: 5),
                          Text("Praga y Bu..."),
                          SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/foto4.jpg"),
                          ),
                          SizedBox(height: 5),
                          Text("Arquitectura"),
                          SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/foto6.jpg"),
                          ),
                          SizedBox(height: 5),
                          Text("Retratos"),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
