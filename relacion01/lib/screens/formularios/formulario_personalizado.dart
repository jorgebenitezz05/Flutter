import 'package:flutter/material.dart';

class FormularioPersonalizado extends StatefulWidget {
  const FormularioPersonalizado({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioPersonalizadoState createState() => _FormularioPersonalizadoState();
}

class _FormularioPersonalizadoState extends State<FormularioPersonalizado> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textEditingControllers = [];
  final List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();

    List<String> fieldNames = [
      "Nombre",
      "Apellidos",
      "Fecha Nacimiento",
      "Dirección",
      "Email",
      "Nº Telefono",
      "Ciudad",
      "Provincia",
      "Código Postal",
    ];

    // Generar los campos de texto y sus controladores.
    for (int i = 0; i < fieldNames.length; i++) {
      String fieldName = fieldNames[i];
      TextEditingController textEditingController =
          TextEditingController(text: "");
      _textEditingControllers.add(textEditingController);
      _widgets.add(Padding(
        padding: const EdgeInsets.all(7.0),
        child: _createTextFormField(fieldName, textEditingController),
      ));
    }

    // Agregar botón para guardar.
    _widgets.add(ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Guardando...")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Por favor, corrija los errores")),
          );
        }
      },
      child: const Text('Guardar'),
    ));
  }

  // Crear cada campo del formulario dependiendo de su tipo.
  TextFormField _createTextFormField(
      String fieldName, TextEditingController controller) {
    if (fieldName == "Fecha Nacimiento") {
      return TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          hintText: 'Seleccione la fecha de nacimiento',
          labelText: 'Fecha de Nacimiento',
        ),
        keyboardType: TextInputType.datetime,
        readOnly: true,
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );

          if (selectedDate != null) {
            setState(() {
              controller.text = "${selectedDate.toLocal()}".split(' ')[0];
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

    // Los demás campos de texto con sus validaciones.
    return TextFormField(
      controller: controller,
      validator: (value) {
        value = value!.trim();
        if (value.isEmpty) {
          return 'Por favor, introduzca $fieldName.';
        }
        // Validaciones según el campo.
        switch (fieldName) {
          case "Nombre":
            if (!(RegExp(r"^[A-ZÑÁÉÍÓÚ][a-zñáéíóú]+(?: [A-ZÑÁÉÍÓÚ][a-zñáéíóú]+)*$")
                .hasMatch(value))) {
              return "El nombre debe comenzar con mayúscula y solo contener letras.";
            }
            break;
          case "Apellidos":
            if (!(RegExp(r"^[A-ZÑÁÉÍÓÚ][a-zñáéíóú]*( [A-ZÑÁÉÍÓÚ][a-zñáéíóú]*)*$")
                .hasMatch(value))) {
              return "Cada apellido debe comenzar con mayúscula y solo contener letras.";
            }
            break;
          case "Dirección":
            if (value.length < 5) {
              return "La dirección debe tener al menos 5 caracteres.";
            }
            break;
          case "Email":
            if (!(RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+$").hasMatch(value))) {
              return "Introduzca un email válido (ejemplo@dominio.com).";
            }
            break;
          case "Nº Telefono":
            if (!(RegExp(r"^\d{9}$").hasMatch(value))) {
              return "Introduzca un número de teléfono válido de 9 dígitos.";
            }
            break;
          case "Ciudad":
            if (!(RegExp(r"^[A-ZÑÁÉÍÓÚ][a-zñáéíóú]+$").hasMatch(value))) {
              return "La ciudad debe comenzar con mayúscula y solo contener letras.";
            }
            break;
          case "Provincia":
            if (!(RegExp(r"^[A-ZÑÁÉÍÓÚ][a-zñáéíóú]+$").hasMatch(value))) {
              return "La provincia debe comenzar con mayúscula y solo contener letras.";
            }
            break;
          case "Código Postal":
            if (!(RegExp(r"^\d{5}$").hasMatch(value))) {
              return "El código postal debe ser un número de 5 dígitos.";
            }
            break;
        }
        return null;
      },
      decoration: InputDecoration(
        icon: Icon(_getIconForField(fieldName)),
        hintText: fieldName,
        labelText: 'Introduzca $fieldName',
      ),
      keyboardType: _getKeyboardTypeForField(fieldName),
    );
  }

  IconData _getIconForField(String fieldName) {
    switch (fieldName) {
      case "Nombre":
        return Icons.person;
      case "Apellidos":
        return Icons.people;
      case "Fecha Nacimiento":
        return Icons.calendar_today;
      case "Dirección":
        return Icons.location_on;
      case "Email":
        return Icons.email;
      case "Nº Telefono":
        return Icons.phone;
      case "Ciudad":
        return Icons.location_city;
      case "Provincia":
        return Icons.location_city;
      case "Código Postal":
        return Icons.map;
      default:
        return Icons.help;
    }
  }

  TextInputType _getKeyboardTypeForField(String fieldName) {
    switch (fieldName) {
      case "Nº Telefono":
        return TextInputType.phone;
      case "Email":
        return TextInputType.emailAddress;
      case "Código Postal":
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario Personalizado"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: _widgets,
          ),
        ),
      ),
    );
  }
}
