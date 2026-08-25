import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/login/login.dart';
import 'package:flutter_application_1/UI/home/login/register.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nombre de la app (aquí iría el logo real)
                const Text(
                  'BetPlay',
                  style: TextStyle(
                    color: AppColors.texto,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Versión 3.2.2',
                  style: TextStyle(
                    color: AppColors.verde,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 80),

                // Botón Iniciar Sesión
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.fondoTarjeta,
                      foregroundColor: AppColors.texto,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
                const SizedBox(height: 15),

                // Botón Crear Cuenta
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.verdeClaro,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                    child: const Text('Crear Cuenta'),
                  ),
                ),
                const SizedBox(height: 40),

                // Pie de página tipo BetPlay
                const Text(
                  'Vigilado Supersalud   |   +18 Autoriza Coljuegos',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textoSecundario, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
