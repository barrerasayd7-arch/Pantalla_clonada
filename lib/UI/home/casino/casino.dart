import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/widget/bottom_nav.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';


class CasinoScreen extends StatefulWidget {
  const CasinoScreen({super.key});

  @override
  State<CasinoScreen> createState() => _CasinoScreenState();
}

class _CasinoScreenState extends State<CasinoScreen> {
  int categoriaSeleccionada = 0; // Slots / En vivo / Poker / Virtuales / ...

  final List<Map<String, dynamic>> categorias = const [
    {'icono': Icons.donut_large, 'texto': 'Slots'},
    {'icono': Icons.videocam_outlined, 'texto': 'En vivo'},
    {'icono': Icons.style_outlined, 'texto': 'Poker'},
    {'icono': Icons.pets, 'texto': 'Virtuales'},
    {'icono': Icons.emoji_events_outlined, 'texto': 'Deportes'},
  ];

  final List<Map<String, String>> juegosNuevos = const [
    {'titulo': 'PORKO COLLECT\nSUPER POT', 'color': 'F4A100'},
    {'titulo': 'PHOENIX STAR\nSUPER POT', 'color': 'D62D5B'},
    {'titulo': 'GOLD RUSH\nMEGA WIN', 'color': '2E7D32'},
  ];

  final List<Map<String, String>> recomendados = const [
    {'titulo': 'TROPICAL\nPARADISE', 'color': '0EA5A5'},
    {'titulo': 'CANDY\nBLAST', 'color': '7B2D8E'},
    {'titulo': 'LUCKY\nSEVEN', 'color': 'B8860B'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      bottomNavigationBar: const BottomNav(seleccionado: 2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior
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
              const SizedBox(height: 18),

              // Buscador
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.fondoTarjeta,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: '¿Qué juego estás buscando?',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Categorías (Slots / En vivo / Poker / Virtuales...)
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorias.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                  itemBuilder: (context, i) {
                    final seleccionado = categoriaSeleccionada == i;
                    return GestureDetector(
                      onTap: () => setState(() => categoriaSeleccionada = i),
                      child: Column(
                        children: [
                          Icon(
                            categorias[i]['icono'],
                            color: seleccionado ? AppColors.verde : Colors.white54,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            categorias[i]['texto'],
                            style: TextStyle(
                              color: seleccionado ? Colors.white : Colors.white54,
                              fontSize: 12,
                              fontWeight: seleccionado ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 24,
                            height: 2,
                            color: seleccionado ? AppColors.verde : Colors.transparent,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Torneos diarios / Juegos Top
              Row(
                children: [
                  _botonPromo('🏆', 'Torneos diarios'),
                  const SizedBox(width: 10),
                  _botonPromo('👑', 'Juegos Top'),
                ],
              ),
              const SizedBox(height: 24),

              _seccionJuegos('Nuevos', juegosNuevos),
              const SizedBox(height: 24),
              _seccionJuegos('Recomendados para-ti', recomendados),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botonPromo(String emoji, String texto) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.fondoTarjeta,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Flexible(
              child: Text(texto,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _seccionJuegos(String titulo, List<Map<String, String>> juegos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            const Text('Ver todos', style: TextStyle(color: AppColors.verde)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: juegos.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final juego = juegos[i];
              return Container(
                width: 110,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(int.parse('FF${juego['color']}', radix: 16)),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.bottomLeft,
                child: Text(
                  juego['titulo']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    height: 1.2,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}