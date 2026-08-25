import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/home.dart';
import 'package:flutter_application_1/UI/home/login/widget/input.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController txUser = TextEditingController();
  final TextEditingController txPass = TextEditingController();

  // Usuario y clave predeterminados
  final String usuarioValido = 'admin';
  final String claveValida = '1234';

  bool recordarDatos = true;

  void _ingresar() {
    if (txUser.text == usuarioValido && txPass.text == claveValida) {
      // Login correcto -> vamos al Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Login incorrecto -> mensaje simple
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Documento o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      appBar: AppBar(
        backgroundColor: AppColors.fondo,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Iniciar sesión', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.fondoTarjeta,
              child: Icon(Icons.login, color: Colors.white),
              radius: 60,
            ),
            const SizedBox(height: 20),

            // Campo documento (usando el widget reutilizable del profesor)
            inputLogin(txUser: txUser, label: 'Documento del usuario'),

            // Campo clave
            inputLogin(txUser: txPass, label: 'Contraseña', esClave: true),

            // Switch "Recordar datos", detalle nuevo pero sencillo
            SwitchListTile(
              value: recordarDatos,
              activeThumbColor: AppColors.verde,
              title: const Text('Recordar datos del usuario', style: TextStyle(color: Colors.white70)),
              onChanged: (valor) {
                setState(() {
                  recordarDatos = valor;
                });
              },
            ),

            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.verde,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _ingresar,
                child: const Text('Ingresar'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('¿Olvidaste tu contraseña?', style: TextStyle(color: AppColors.verde)),
            ),
          ],
        ),
      ),
    );
  }
}
