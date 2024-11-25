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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const Text(
              '"Nunca sabes lo que te depara el futuro."',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Text(
              "faqsandroid.com/",
              style: TextStyle(color: Color.fromARGB(255, 12, 116, 201)),
            ),
            const SizedBox(height: 10.0),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto2.jpg"),
                      ),
                      SizedBox(height: 5),
                      Text("Pilotando", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto3.jpg"),
                      ),
                      SizedBox(height: 5),
                      Text("Praga y Bu...", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto4.jpg"),
                      ),
                      SizedBox(height: 5),
                      Text("Arquitectura", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto6.jpg"),
                      ),
                      SizedBox(height: 5),
                      Text("Retratos", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto7.png"),
                      ),
                      SizedBox(height: 5),
                      Text("Retratos", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto8.jpg"),
                      ),
                      SizedBox(height: 5),
                      Text("Atardecer", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/foto9.png"),
                      ),
                      SizedBox(height: 5),
                      Text("Piedras", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
