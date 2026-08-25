import 'package:flutter/material.dart';


// el texto de la etiqueta (label) y si debe ocultar el texto (para claves).
class inputLogin extends StatelessWidget {
  const inputLogin({
    super.key,
    required this.txUser,
    this.label = 'ingrese el usuario',
    this.esClave = false,
  });

  final TextEditingController txUser;
  final String label;
  final bool esClave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: txUser,
        obscureText: esClave,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
        ),
      ),
    );
  }
}
