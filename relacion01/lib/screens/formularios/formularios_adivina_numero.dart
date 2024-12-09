import 'dart:math';
import 'package:flutter/material.dart';

class FormularioNumeroAdivinar extends StatefulWidget {
  const FormularioNumeroAdivinar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioNumeroAdivinarState createState() =>
      _FormularioNumeroAdivinarState();
}

class _FormularioNumeroAdivinarState extends State<FormularioNumeroAdivinar> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textEditingControllers = [];
  late final int _numeroAdivinar; 
  String _mensaje = ''; 

  @override
  void initState() {
    super.initState();
    _textEditingControllers.add(TextEditingController());
    _textEditingControllers.add(TextEditingController());
    _textEditingControllers.add(TextEditingController()); 
    _textEditingControllers.add(TextEditingController()); 

    _numeroAdivinar = Random().nextInt(100) + 1; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextFormField(
                  controller: _textEditingControllers[0], 
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Introduce tu nombre de usuario',
                    labelText: 'Usuario',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un nombre de usuario';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextFormField(
                  controller: _textEditingControllers[1],
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Introduce tu contraseña',
                    labelText: 'Contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa una contraseña';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextFormField(
                  controller: _textEditingControllers[2], 
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Confirma tu contraseña',
                    labelText: 'Confirmar Contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirma tu contraseña';
                    }
                    if (value != _textEditingControllers[1].text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextFormField(
                  controller: _textEditingControllers[3], 
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.add),
                    hintText: 'Introduce un número entre 1 y 100',
                    labelText: 'Adivina el Número',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce un número';
                    }

                    int? numero = int.tryParse(value);
                    if (numero == null || numero < 1 || numero > 100) {
                      return 'El número debe estar entre 1 y 100';
                    }

                    if (numero < _numeroAdivinar) {
                      setState(() {
                        _mensaje = 'El número es mayor, intenta de nuevo.';
                      });
                    } else if (numero > _numeroAdivinar) {
                      setState(() {
                        _mensaje = 'El número es menor, intenta de nuevo.';
                      });
                    } else {
                      setState(() {
                        _mensaje = '¡Felicidades! Adivinaste el número.';
                      });
                    }
                    return null;
                  },
                ),
              ),
              if (_mensaje.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    _mensaje,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _textEditingControllers[3].text == _numeroAdivinar.toString()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Formulario enviado")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Por favor, corrige los errores")),
                    );
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
