import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/casino/casino.dart';
import 'package:flutter_application_1/UI/home/deporte/deporte.dart';
import 'package:flutter_application_1/UI/home/home.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';
import 'package:flutter_application_1/ui/home/billetera/billetera.dart';
import 'package:flutter_application_1/ui/home/perfil/perfil.dart';

// Barra inferior tipo BetPlay: Inicio, Deporte, Casino, Billetera, Perfil.
// Recibe el índice seleccionado desde afuera y navega entre pantallas.
class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.seleccionado});

  final int seleccionado;

  final List<Map<String, dynamic>> items = const [
    {'icono': Icons.home, 'texto': 'Inicio'},
    {'icono': Icons.sports_soccer, 'texto': 'Deporte'},
    {'icono': Icons.casino, 'texto': 'Casino'},
    {'icono': Icons.account_balance_wallet, 'texto': 'Billetera'},
    {'icono': Icons.person, 'texto': 'Perfil'},
  ];

  void _navegar(BuildContext context, int index) {
    if (index == seleccionado) return;

    Widget pantalla;
    switch (index) {
      case 0:
        pantalla = const HomeScreen();
        break;
      case 1:
        pantalla = const DeporteScreen();
        break;
      case 2:
        pantalla = const CasinoScreen();
        break;
      case 3:
        pantalla = const BilleteraScreen();
        break;
      case 4:
      default:
        pantalla = const PerfilScreen();
        break;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => pantalla,
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: seleccionado,
      backgroundColor: AppColors.fondoTarjeta,
      selectedItemColor: AppColors.verde,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => _navegar(context, index),
      items: items
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item['icono']),
                label: item['texto'],
              ))
          .toList(),
    );
  }
}