import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/widget/bottom_nav.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';


class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      bottomNavigationBar: const BottomNav(seleccionado: 4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior (igual que en Home)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('BetPlay',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.verde,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text('\$ 1,000', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 6),
                        Icon(Icons.attach_money, color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                  const Icon(Icons.headset_mic, color: Colors.white),
                ],
              ),
              const SizedBox(height: 25),

              // Avatar + tiempo de sesión + nombre
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.fondoTarjeta,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, color: Colors.white70, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Tiempo de sesión: 02:53',
                          style: TextStyle(color: AppColors.textoSecundario, fontSize: 12)),
                      SizedBox(height: 4),
                      Text('Sayd Barrera',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Text('Mis apuestas', style: const TextStyle(color: Colors.white, fontSize: 15)),
              const Divider(color: Colors.white24, height: 32),
              _opcionExpandible('Mi información personal'),
              const Divider(color: Colors.white24, height: 32),
              _opcionExpandible('Mis ajustes'),
              const Divider(color: Colors.white24, height: 32),

              GestureDetector(
                onTap: () {
                  // TODO: lógica de cerrar sesión
                },
                child: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.redAccent,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _opcionExpandible(String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(texto, style: const TextStyle(color: Colors.white, fontSize: 15)),
        const Icon(Icons.add, color: Colors.white70, size: 20),
      ],
    );
  }
}