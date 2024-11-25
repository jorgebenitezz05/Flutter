import 'package:flutter/material.dart';

class ParteMediaBaja extends StatefulWidget {
  const ParteMediaBaja({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ParteMediaBajaState createState() => _ParteMediaBajaState();
}

class _ParteMediaBajaState extends State<ParteMediaBaja> {
  bool isAccountBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAccountBoxSelected = false;
                  });
                },
                child: Column(
                  children: [
                    const Icon(Icons.view_compact, size: 30),
                    const SizedBox(height: 2),
                    Container(
                      height: 2,
                      width: 180,
                      color: isAccountBoxSelected
                          ? Colors.transparent
                          : Colors.black,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAccountBoxSelected = true;
                  });
                },
                child: Column(
                  children: [
                    const Icon(Icons.account_box_outlined, size: 30),
                    const SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 190,
                      color: isAccountBoxSelected
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                ),
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
              children: getImages(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getImages() {
    List<Widget> images = [];

    if (isAccountBoxSelected) {
      images.add(Image.asset("assets/images/foto10.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto11.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto12.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto13.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto6.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto3.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto7.png", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto8.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto1.jpg", fit: BoxFit.cover));
    } else {
      images.add(Image.asset("assets/images/foto1.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto2.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto3.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto4.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto5.jpeg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto6.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto7.png", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto8.jpg", fit: BoxFit.cover));
      images.add(Image.asset("assets/images/foto9.png", fit: BoxFit.cover));
    }

    return images;
  }
}
