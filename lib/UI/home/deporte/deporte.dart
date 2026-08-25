import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/widget/bottom_nav.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';


class DeporteScreen extends StatefulWidget {
  const DeporteScreen({super.key});

  @override
  State<DeporteScreen> createState() => _DeporteScreenState();
}

class _DeporteScreenState extends State<DeporteScreen> {
  int tabSuperior = 0; // Inicio / En vivo / Próximos / Buscar / Cupón / Resultados
  int deporteSeleccionado = 4; // índice dentro de la lista de deportes (fútbol)

  final List<Map<String, dynamic>> tabsSuperiores = const [
    {'icono': Icons.home_outlined, 'texto': 'Inicio'},
    {'icono': Icons.podcasts, 'texto': 'En vivo'},
    {'icono': Icons.watch_later_outlined, 'texto': 'Próximos'},
    {'icono': Icons.search, 'texto': 'Buscar'},
    {'icono': Icons.local_offer_outlined, 'texto': 'Cupón'},
    {'icono': Icons.table_chart_outlined, 'texto': 'Resultados'},
  ];

  final List<Map<String, dynamic>> deportes = const [
    {'icono': Icons.emoji_events_outlined, 'texto': 'Destacados'},
    {'icono': Icons.public, 'texto': 'Todos'},
    {'icono': Icons.sports_basketball, 'texto': 'Basket'},
    {'icono': Icons.sports_tennis, 'texto': 'Tenis'},
    {'icono': Icons.sports_soccer, 'texto': 'Fútbol'},
    {'icono': Icons.sports_hockey, 'texto': 'Hockey'},
    {'icono': Icons.sports_football, 'texto': 'NFL'},
  ];

  final List<Map<String, String>> combinadas = const [
    {
      'liga': 'Fútbol / Copa Libertadores',
      'fecha': 'Hoy @ 07:30 p.m.',
      'local': 'Independiente del V...',
      'visitante': 'Deportes Toli...',
    },
    {
      'liga': 'Fútbol / Liga BetPlay',
      'fecha': 'Hoy @ 08:10 p.m.',
      'local': 'Millonarios',
      'visitante': 'Junior',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      bottomNavigationBar: const BottomNav(seleccionado: 1),
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

              // Fila de íconos: Inicio / En vivo / Próximos / Buscar / Cupón / Resultados
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabsSuperiores.length, (i) {
                  final seleccionado = tabSuperior == i;
                  return GestureDetector(
                    onTap: () => setState(() => tabSuperior = i),
                    child: Column(
                      children: [
                        Icon(
                          tabsSuperiores[i]['icono'],
                          color: seleccionado ? AppColors.verde : Colors.white54,
                          size: 22,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 18,
                          height: 2,
                          color: seleccionado ? AppColors.verde : Colors.transparent,
                        ),
                      ],
                    ),
                  );
                }),
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
                    hintText: 'Busca deportes, ligas o equipos',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Chips de deportes
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: deportes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final seleccionado = deporteSeleccionado == i;
                    return GestureDetector(
                      onTap: () => setState(() => deporteSeleccionado = i),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: seleccionado ? Colors.pinkAccent : AppColors.fondoTarjeta,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          deportes[i]['icono'],
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Banner "VIVO"
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B2B63), AppColors.fondoTarjeta],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('VIVO',
                          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 4,
                        backgroundColor: Colors.white24,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('43 eventos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Combinadas para ti
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Combinadas para ti',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  Icon(Icons.close, color: Colors.white54, size: 18),
                ],
              ),
              const SizedBox(height: 12),

              ...combinadas.map((partido) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.fondoTarjeta,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(partido['liga']!,
                            style: const TextStyle(color: AppColors.textoSecundario, fontSize: 12)),
                        const SizedBox(height: 4),
                        Text(partido['fecha']!,
                            style: const TextStyle(color: Colors.white54, fontSize: 11)),
                        const SizedBox(height: 6),
                        Text('${partido['local']}  -  ${partido['visitante']}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}