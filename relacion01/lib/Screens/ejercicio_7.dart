import 'package:flutter/material.dart';

class Ejercicio7 extends StatelessWidget {
  const Ejercicio7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jorge Benítez"),
      ),
      body: const MiContador(),
    );
  }
}

class MiContador extends StatefulWidget {
  const MiContador({super.key});

  @override
  State<MiContador> createState() => _MiContadorState();
}

class _MiContadorState extends State<MiContador> {
  int numeroVeces = 0;

  incrementar() {
    setState(() {
      numeroVeces++;
    });
  }

  disminuir() {
    setState(() {
      if (numeroVeces != 0) {
        numeroVeces--;
      }
    });
  }

  irACero() {
    setState(() {
      numeroVeces = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Has pulsado $numeroVeces veces",
            style: const TextStyle(fontSize: 30),
          ),
          Align(
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: disminuir,
                  icon: const Icon(Icons.remove),
                  label: const Text('Disminuir'),
                ),
                ElevatedButton(
                  onPressed: irACero,
                  child: const Text('Reiniciar a 0'),
                ),
                ElevatedButton.icon(
                  onPressed: incrementar,
                  icon: const Icon(Icons.add),
                  label: const Text('Incrementar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
