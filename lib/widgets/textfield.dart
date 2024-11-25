import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.label,
    this.controller,
    this.isPassword = false,
  }) : super(key: key);

  final String hint;
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

@override
Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.5), // Color de fondo negro con 50% de opacidad
      borderRadius: BorderRadius.circular(6),
    ),
    child: TextField(
      style: const TextStyle(color: Colors.white), // Color del texto del TextField en blanco
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 14), // Color y tamaño del hint
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 14), // Color y tamaño del label
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        enabledBorder: OutlineInputBorder( // Borde del TextField cuando no está enfocado
          borderSide: const BorderSide(color: Colors.white, width: 1.2), // Borde blanco con un grosor de 2
          borderRadius: BorderRadius.circular(6), // Radio del borde igual al del Container
        ),
        focusedBorder: OutlineInputBorder( // Borde del TextField cuando está enfocado
          borderSide: const BorderSide(color: Colors.white, width: 1.2), // Borde blanco con un grosor de 2
          borderRadius: BorderRadius.circular(6), // Radio del borde igual al del Container
        ),
      ),
    ),
  );
}
}