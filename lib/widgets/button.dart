import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Color del botón azul
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Radio de esquinas de 5
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white, // Color del texto blanco
            fontFamily: 'Signika Negative',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}