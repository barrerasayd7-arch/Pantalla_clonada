import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/login/widget/input.dart';
import 'package:flutter_application_1/UI/theme/colors.dart';



class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController txtUser = TextEditingController();
  final TextEditingController txtPass = TextEditingController();
  final TextEditingController txtPass1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      appBar: AppBar(
        backgroundColor: AppColors.fondo,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Crear Cuenta', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.fondoTarjeta,
              child: Icon(Icons.person_add, color: Colors.white),
              radius: 60,
            ),
            const SizedBox(height: 10),
            inputLogin(txUser: txtUser, label: 'Nombre'),
            inputLogin(txUser: txtUser, label: 'Apellidos'),
            inputLogin(txUser: txtPass, label: 'Ingrese Clave', esClave: true),
            inputLogin(txUser: txtPass1, label: 'Confirmar Clave', esClave: true),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.verdeClaro,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context); // vuelve a la pantalla anterior
                },
                child: const Text('Registrarse'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Iniciar Sesión', style: TextStyle(color: AppColors.verde)),
            )
          ],
        ),
      ),
    );
  }
}
