import 'package:flutter/material.dart';
import 'screens.dart';

class Ejercicio12 extends StatefulWidget {
  const Ejercicio12({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Ejercicio12State createState() => _Ejercicio12State();
}

class _Ejercicio12State extends State<Ejercicio12> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textEditingControllers = [];
  bool _esFormularioIzquierda = true;
  bool _tieneHijos = false;
  List<int> _edadesHijos = [0, 0, 0];
  String _genero = "Prefiero no contestar";
  final List<bool> _aficiones = [false, false, false, false, false];
  DateTime _fechaNacimiento = DateTime.now();

  @override
  void initState() {
    super.initState();

    // Inicialización de los controladores de texto
    _textEditingControllers.add(TextEditingController());
    _textEditingControllers.add(TextEditingController());
    _textEditingControllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 12 No Dual 2"),
        actions: [
          Switch(
            value: !_esFormularioIzquierda,
            onChanged: (bool value) {
              setState(() {
                _esFormularioIzquierda = !value;
              });
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Mostrar formulario de la izquierda o derecha basado en la posición
              if (_esFormularioIzquierda) ...[
                _createTextFormField("Nombre completo", _textEditingControllers[0], icon: Icons.person),
                _createTextFormField("Correo electrónico", _textEditingControllers[1], keyboardType: TextInputType.emailAddress, icon: Icons.email),
                _createTextFormField("Teléfono", _textEditingControllers[2], keyboardType: TextInputType.phone, icon: Icons.phone),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CheckboxListTile(
                    title: const Text('¿Tienes hijos?'),
                    value: _tieneHijos,
                    onChanged: (bool? value) {
                      setState(() {
                        _tieneHijos = value!;
                      });
                    },
                  ),
                ),
                if (_tieneHijos) ...[
                  const Text("Número de hijos:"),
                  _createChildrenDropdown(),
                  const Text("Edad de los hijos:"),
                  ..._createChildrenAgeFields(),
                ],
              ] else ...[
                _createDatePickerField(),
                _createCityDropdown(),
                const Text("Aficiones"),
                _createHobbiesCheckboxes(),
                _createGenderRadioButtons(),
              ],
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Formulario enviado")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Por favor, corrija los errores")),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _createTextFormField(String fieldName, TextEditingController controller, 
    {TextInputType keyboardType = TextInputType.text, IconData? icon}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        value = value!.trim();
        if (value.isEmpty) {
          return 'Por favor, introduzca $fieldName.';
        }
        switch (fieldName) {
          case "Nombre completo":
            if (!(RegExp(
                    r"^[A-ZÑÁÉÍÓÚ][a-zñáéíóú]+(?: [A-ZÑÁÉÍÓÚ][a-zñáéíóú]+)*$")
                .hasMatch(value))) {
              return "El nombre debe comenzar con mayúscula y solo contener letras.";
            }
            break;
          case "Correo electrónico":
            if (!(RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+$").hasMatch(value))) {
              return "Introduzca un email válido (ejemplo@dominio.com).";
            }
            break;
          case "Teléfono":
            if (!(RegExp(r"^\d{9}$").hasMatch(value))) {
              return "Introduzca un número de teléfono válido de 9 dígitos.";
            }
            break;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Introduzca $fieldName',
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }

  TextFormField _createDatePickerField() {
    return TextFormField(
      controller: TextEditingController(
          text: "${_fechaNacimiento.toLocal()}".split(' ')[0]),
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: "Fecha de nacimiento",
        hintText: 'Seleccione la fecha de nacimiento',
      ),
      readOnly: true, 
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: _fechaNacimiento,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null && selectedDate != _fechaNacimiento) {
          setState(() {
            _fechaNacimiento = selectedDate;
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Por favor, seleccione una fecha.";
        }
        return null;
      },
    );
  }

  DropdownButtonFormField<int> _createChildrenDropdown() {
    return DropdownButtonFormField<int>(
      decoration: const InputDecoration(
        labelText: "Número de hijos",
        icon: Icon(Icons.child_care),
      ),
      items: List.generate(3, (index) {
        return DropdownMenuItem<int>(
          value: index + 1,
          child: Text("${index + 1} hijo${index + 1 > 1 ? 's' : ''}"),
        );
      }),
      onChanged: (value) {
        setState(() {
          // Limitar a un máximo de 3 hijos
          _edadesHijos = List<int>.filled(value!, 0);
        });
      },
      value: _edadesHijos.length,
      validator: (value) {
        if (value == null || value == 0) {
          return "Por favor, seleccione el número de hijos.";
        }
        return null;
      },
    );
  }

  List<Widget> _createChildrenAgeFields() {
    return List.generate(_edadesHijos.length, (index) {
      return TextFormField(
        decoration: InputDecoration(
          labelText: "Edad del hijo ${index + 1}",
          icon: const Icon(Icons.child_care),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            _edadesHijos[index] = int.tryParse(value) ?? 0;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor, introduzca la edad del hijo.";
          }
          int? edad = int.tryParse(value);
          if (edad == null || edad <= 0 || edad > 18) {
            return "La edad debe ser entre 1 y 18 años.";
          }
          return null;
        },
      );
    });
  }

  DropdownButtonFormField<String> _createCityDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Ciudad de Andalucía",
        icon: Icon(Icons.location_city),
      ),
      items: [
        "Sevilla",
        "Córdoba",
        "Granada",
        "Málaga",
        "Jaén",
        "Almería",
        "Cádiz"
      ].map((ciudad) {
        return DropdownMenuItem<String>(
          value: ciudad,
          child: Text(ciudad),
        );
      }).toList(),
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Por favor, seleccione una ciudad.";
        }
        return null;
      },
    );
  }

  Column _createHobbiesCheckboxes() {
    List<String> aficiones = ["Deporte", "Lectura", "Viajar", "Música", "Cine"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: aficiones.map((aficion) {
        int index = aficiones.indexOf(aficion);
        return CheckboxListTile(
          title: Row(
            children: [
              Icon(
                index == 0 ? Icons.sports : 
                (index == 1 ? Icons.book : 
                (index == 2 ? Icons.airplanemode_active_outlined : 
                (index == 3 ? Icons.music_note : Icons.movie)))),

              Text(aficion)
            ],
          ),
          value: _aficiones[index],
          onChanged: (bool? value) {
            setState(() {
              _aficiones[index] = value!;
            });
          },
        );
      }).toList(),
    );
  }

  Column _createGenderRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sexo"),
        ListTile(
          title: const Text('Hombre'),
          leading: const Icon(Icons.male),
          trailing: Radio<String>(
            value: 'Hombre',
            groupValue: _genero,
            onChanged: (String? value) {
              setState(() {
                _genero = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mujer'),
          leading: const Icon(Icons.female),
          trailing: Radio<String>(
            value: 'Mujer',
            groupValue: _genero,
            onChanged: (String? value) {
              setState(() {
                _genero = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Prefiero no contestar'),
          leading: const Icon(Icons.help_outline),
          trailing: Radio<String>(
            value: 'Prefiero no contestar',
            groupValue: _genero,
            onChanged: (String? value) {
              setState(() {
                _genero = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
