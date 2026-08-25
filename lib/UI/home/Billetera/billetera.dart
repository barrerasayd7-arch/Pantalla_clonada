import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/widget/bottom_nav.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';

class BilleteraScreen extends StatefulWidget {
  const BilleteraScreen({super.key});

  @override
  State<BilleteraScreen> createState() => _BilleteraScreenState();
}

class _BilleteraScreenState extends State<BilleteraScreen> {
  int filtroSeleccionado = 0; // 0 = Todos, 1 = Recargas, 2 = Retiros

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      bottomNavigationBar: const BottomNav(seleccionado: 3),
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
              const SizedBox(height: 25),

              // Saldo total
              const Center(
                child: Text('Saldo Total', style: TextStyle(color: AppColors.textoSecundario)),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$ 1.000,0',
                        style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.visibility_outlined, color: Colors.white70, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Saldo base / bonos activos / otros bonos
              Row(
                children: [
                  _columnaSaldo('Saldo Base', '\$ 1.000,0'),
                  _divisorVertical(),
                  _columnaSaldo('Bonos activos', '\$ 0,0'),
                  _divisorVertical(),
                  _columnaSaldo('Otros bonos', '\$ 0,0'),
                ],
              ),
              const SizedBox(height: 25),

              const Text('Mis opciones', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.attach_money, color: AppColors.verde),
                      label: const Text('Recargar', style: TextStyle(color: Colors.white)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.verde),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.account_balance_wallet_outlined, color: AppColors.verde),
                      label: const Text('Retirar', style: TextStyle(color: Colors.white)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.verde),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              const Text('Mis últimos movimientos',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),

              // Filtro tipo segmented control
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.fondoTarjeta,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _tabFiltro('Todos', 0),
                    _tabFiltro('Recargas', 1),
                    _tabFiltro('Retiros', 2),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Item de movimiento (ejemplo, luego lo puedes volver una lista)
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.fondoTarjeta,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.account_balance_wallet_outlined,
                        color: Colors.white70, size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RETIRO POR', style: TextStyle(color: Colors.white, fontSize: 13)),
                        Text('21 Ago 2026 - 22:17hr',
                            style: TextStyle(color: AppColors.textoSecundario, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Text('+\$50.000',
                      style: TextStyle(color: AppColors.verde, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Ver mas',
                      style: TextStyle(color: Colors.redAccent, decoration: TextDecoration.underline)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnaSaldo(String titulo, String monto) {
    return Expanded(
      child: Column(
        children: [
          Text(titulo, style: const TextStyle(color: AppColors.textoSecundario, fontSize: 12)),
          const SizedBox(height: 4),
          Text(monto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _divisorVertical() {
    return Container(width: 1, height: 30, color: Colors.white24);
  }

  Widget _tabFiltro(String texto, int indice) {
    final seleccionado = filtroSeleccionado == indice;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => filtroSeleccionado = indice),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: seleccionado ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: seleccionado ? AppColors.fondo : Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}