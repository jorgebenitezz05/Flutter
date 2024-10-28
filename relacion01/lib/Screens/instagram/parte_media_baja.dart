import 'package:flutter/material.dart';

class ParteMediaBaja extends StatelessWidget {
  const ParteMediaBaja({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Icon(Icons.view_compact, size: 30),
                const SizedBox(height: 2),
                Container(
                  height: 2,
                  width: 180,
                  color: Colors.black,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(Icons.account_box_outlined, size: 30),
                const SizedBox(height: 5),
                Container(
                  height: 2,
                  width: 190,
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 270,
          child: GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: [
              Image.asset("assets/images/foto1.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/foto2.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/foto3.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/foto4.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/foto5.jpeg", fit: BoxFit.cover),
              Image.asset("assets/images/foto6.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/foto7.png", fit: BoxFit.cover),
              Image.asset("assets/images/foto8.jpg", fit: BoxFit.cover),
              Image.asset("assets/images/foto9.png", fit: BoxFit.cover),
            ],
          ),
        ),
      ],
    );
  }
}
