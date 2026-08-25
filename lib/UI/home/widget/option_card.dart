import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';

// Tarjeta reutilizable para "Deportivas" y "Casino" en el Home.
class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.icono, required this.texto});

  final IconData icono;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.fondoTarjeta,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icono, color: AppColors.verde, size: 26),
            const SizedBox(height: 8),
            Text(texto, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
