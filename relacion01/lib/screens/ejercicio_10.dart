import 'package:flutter/material.dart';
import 'screens.dart';

class Ejercicio10 extends StatelessWidget {
  const Ejercicio10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 10"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text("Instrucciones"),
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "El objetivo del juego es acercarse lo más posible a 7.5 sin pasarse. "
                        "Las figuras (Sota, Caballo, Rey) valen 0.5 puntos, y el resto de las cartas valen su número."
                        "\nGana quien primero alcance 5 victorias.",
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cerrar"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: const Juego7yMedia(),
    );
  }
}

class Juego7yMedia extends StatefulWidget {
  const Juego7yMedia({super.key});

  @override
  State<Juego7yMedia> createState() => _Juego7yMediaState();
}

class _Juego7yMediaState extends State<Juego7yMedia> {
  // Baraja de cartas
  final List<Map<String, dynamic>> _baraja = [];

  // Puntuaciones
  double _puntuacionJugador = 0;
  double _puntuacionMesa = 0;

  // Estados del juego
  bool _turnoJugador = true;
  bool _juegoTerminado = false;
  String _mensaje = '';

  String _cartaJugador = '';

  @override
  void initState() {
    super.initState();
    _inicializarBaraja();
    _mezclarBaraja();
  }

  // Inicializar baraja
  void _inicializarBaraja() {
    final palos = ['Oros', 'Copas', 'Espadas', 'Bastos'];
    for (var palo in palos) {
      for (var i = 1; i <= 12; i++) {
        double valor = i > 7 ? 0.5 : i.toDouble();
        _baraja.add({'nombre': '$i de $palo', 'valor': valor});
      }
    }
  }

  // Mezclar baraja
  void _mezclarBaraja() {
    _baraja.shuffle();
  }

  // Sacar una carta
  Map<String, dynamic> _sacarCarta() {
    return _baraja.removeLast();
  }

  // Lógica del turno de la mesa
  void _turnoMesa() {
    while (_puntuacionMesa < 5.5 && _baraja.isNotEmpty) {
      final carta = _sacarCarta();
      _puntuacionMesa += carta['valor'];
    }

    _verResultado();
  }

  // Ver el resultado
  void _verResultado() {
    setState(() {
      if (_puntuacionJugador > 7.5) {
        _mensaje = 'Te pasaste. Pierdes.\n Tu puntuación ha sido: ${_puntuacionJugador.toString()}';
      } else if (_puntuacionMesa > 7.5) {
        _mensaje =
            'La computadora se pasó. ¡Ganas!\nPuntuación de la mesa: ${_puntuacionMesa.toString()}';
      } else if (_puntuacionJugador > _puntuacionMesa) {
        _mensaje =
            '¡Ganas con $_puntuacionJugador puntos!\nPuntuación de la mesa: ${_puntuacionMesa.toString()}';
      } else if (_puntuacionJugador < _puntuacionMesa) {
        _mensaje = 'Pierdes. La mesa obtuvo $_puntuacionMesa puntos.';
      } else {
        _mensaje =
            'Es un empate.\nPuntuación de la mesa: ${_puntuacionMesa.toString()}';
      }
      _juegoTerminado = true;
    });
  }

  // Acción de pedir carta
  void _pedirCarta() {
    if (_juegoTerminado || !_turnoJugador || _baraja.isEmpty) return;

    final carta = _sacarCarta();
    setState(() {
      _puntuacionJugador += carta['valor'];
      _cartaJugador = carta['nombre'];
      if (_puntuacionJugador > 7.5) {
        _verResultado();
      }
    });
  }

  // Acción de plantarse
  void _plantarse() {
    setState(() {
      _turnoJugador = false;
    });
    _turnoMesa();
  }

  // Reiniciar juego
  void _reiniciarJuego() {
    setState(() {
      _baraja.clear();
      _puntuacionJugador = 0;
      _puntuacionMesa = 0;
      _turnoJugador = true;
      _juegoTerminado = false;
      _mensaje = '';
      _cartaJugador = '';
      _inicializarBaraja();
      _mezclarBaraja();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_mensaje.isNotEmpty)
              Text(
                _mensaje,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            if (!_juegoTerminado) ...[
              if (_cartaJugador.isNotEmpty)
                Text(
                  'Carta sacada: $_cartaJugador',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 10),
              Text(
                'Tu puntuación: $_puntuacionJugador',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pedirCarta,
                child: const Text('Pedir Carta'),
              ),
              ElevatedButton(
                onPressed: _plantarse,
                child: const Text('Plantarse'),
              ),
            ],
            if (_juegoTerminado)
              ElevatedButton(
                onPressed: _reiniciarJuego,
                child: const Text('Reiniciar Juego'),
              ),
          ],
        ),
      ),
    );
  }
}
