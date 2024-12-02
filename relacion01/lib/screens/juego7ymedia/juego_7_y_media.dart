import 'package:flutter/material.dart';

class Juego7yMedia extends StatefulWidget {
  const Juego7yMedia({super.key});

  @override
  State<Juego7yMedia> createState() => _Juego7yMediaState();
}

class _Juego7yMediaState extends State<Juego7yMedia> {
  final List<Map<String, dynamic>> _baraja = [];
  double _puntuacionJugador = 0, _puntuacionMesa = 0;
  int _victoriasJugador = 0, _victoriasMesa = 0;
  bool _turnoJugador = true, _juegoTerminado = false;
  String _mensaje = '', _cartaJugador = '';

  @override
  void initState() {
    super.initState();
    _inicializarBaraja(); 
    _mezclarBaraja(); 
  }

// Inicializa la baraja
void _inicializarBaraja() {
  final palos = ['Oros', 'Copas', 'Espadas', 'Bastos'];
  _baraja.addAll(palos.expand((palo) {
    return List.generate(12, (i) {
      final numero = i + 1;
      return {
        'nombre': '$numero de $palo',
        'valor': numero > 7 ? 0.5 : numero.toDouble(),
      };
    });
  }));
}

  // Mezcla las cartas de la baraja
  void _mezclarBaraja() => _baraja.shuffle();

  // Devuelve la última carta de la baraja
  Map<String, dynamic> _sacarCarta() => _baraja.removeLast();

  // Lógica del turno de la mesa
  void _turnoMesa() {
    while (_puntuacionMesa < 5.5 && _baraja.isNotEmpty) {
      _puntuacionMesa += _sacarCarta()['valor'];
    }
    _verResultado();
  }

  // Ver el resultado
  void _verResultado() {
    setState(() {
      if (_puntuacionJugador > 7.5) {
        _mensaje = 'Te pasaste. Pierdes.\nTu puntuación fue: $_puntuacionJugador';
        _victoriasMesa++;
      } else if (_puntuacionMesa > 7.5) {
        _mensaje = 'La computadora se pasó. ¡Ganas!\nPuntuación de la mesa: $_puntuacionMesa';
        _victoriasJugador++;
      } else if (_puntuacionJugador > _puntuacionMesa) {
        _mensaje = '¡Ganas con $_puntuacionJugador puntos!\nPuntuación de la mesa: $_puntuacionMesa';
        _victoriasJugador++;
      } else if (_puntuacionJugador < _puntuacionMesa) {
        _mensaje = 'Pierdes. La mesa obtuvo $_puntuacionMesa puntos.';
        _victoriasMesa++;
      } else {
        _mensaje = 'Es un empate.\nPuntuación de la mesa: $_puntuacionMesa';
      }
      if (_victoriasJugador == 5 || _victoriasMesa == 5) {
        _mostrarDialogFinalizado();
      } else {
        _juegoTerminado = true;
      }
    });
  }

  // Acción de pedir carta 
  void _pedirCarta() {
    if (_juegoTerminado || !_turnoJugador || _baraja.isEmpty) return;
    final carta = _sacarCarta();
    setState(() {
      _puntuacionJugador += carta['valor'];
      _cartaJugador = carta['nombre'];
      if (_puntuacionJugador > 7.5) _verResultado();
    });
  }

  // Acción de plantarse 
  void _plantarse() {
    setState(() {
      _turnoJugador = false;
    });
    _turnoMesa();
  }

  // Muestra un dialogo cuando alguno llega a 5 victorias
  void _mostrarDialogFinalizado() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(_victoriasJugador == 5 ? '¡Ganaste!' : '¡Perdiste!'),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _victoriasJugador == 5
                  ? 'Has alcanzado 5 victorias. ¡Felicidades!'
                  : 'La mesa alcanzó 5 victorias. ¡Lo intentaste!',
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                _reiniciarJuegoFinalizado();
              },
              child: const Text("Cerrar"),
            ),
          ),
        ],
      ),
    );
  }

  // Reinicia el juego 
  void _reiniciarJuego() {
    setState(() {
      _baraja.clear();
      _puntuacionJugador = _puntuacionMesa = 0;
      _turnoJugador = true;
      _juegoTerminado = false;
      _mensaje = _cartaJugador = '';
      _inicializarBaraja();
      _mezclarBaraja();
    });
  }

  // Reinicia el juego cuando alguien llega a 5 victorias
  void _reiniciarJuegoFinalizado() {
    setState(() {
      _victoriasJugador = _victoriasMesa = 0;
      _reiniciarJuego();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jugador: $_victoriasJugador', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Mesa: $_victoriasMesa', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_mensaje.isNotEmpty)
                    Text(_mensaje, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  if (!_juegoTerminado) ...[
                    if (_cartaJugador.isNotEmpty)
                      Text('Carta sacada: $_cartaJugador', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text('Tu puntuación: $_puntuacionJugador', style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: _pedirCarta, child: const Text("Pedir Carta")), 
                    ElevatedButton(onPressed: _plantarse, child: const Text("Plantarse")),
                  ],
                  if (_juegoTerminado)
                    ElevatedButton(onPressed: _reiniciarJuego, child: const Text("Reiniciar Ronda")), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
