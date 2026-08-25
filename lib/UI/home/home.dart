import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/widget/bottom_nav.dart';
import 'package:flutter_application_1/UI/home/widget/option_card.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      bottomNavigationBar: const BottomNav(seleccionado: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior: logo + saldo + soporte
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

              const Text('¿Qué quiero jugar hoy?',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),

              // Tarjetas Deportivas / Casino
              const Row(
                children: [
                  OptionCard(icono: Icons.sports_soccer, texto: 'Deportivas'),
                  OptionCard(icono: Icons.diamond_outlined, texto: 'Casino'),
                ],
              ),
              const SizedBox(height: 25),

              const Text('Encuentra lo que buscas', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.fondoTarjeta,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Busca aquí...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Promociones para mi', style: TextStyle(color: Colors.white)),
                  Text('Ver todas', style: TextStyle(color: AppColors.verde)),
                ],
              ),
              const SizedBox(height: 12),

              // Bloque de jackpots (Mega / Super), como en la captura
              Row(
                children: [
                  _tarjetaJackpot('MEGA', '\$96.687.850'),
                  const SizedBox(width: 10),
                  _tarjetaJackpot('SUPER', '\$10.360.000'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método simple de apoyo para no repetir código en los dos jackpots
  Widget _tarjetaJackpot(String titulo, String monto) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.fondoTarjeta,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: const TextStyle(color: AppColors.verde, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(monto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const Text('Gana hasta 500 millones', style: TextStyle(color: Colors.white54, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
