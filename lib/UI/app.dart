import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/home/login/welcome.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BetPlay Clon',
      home: const WelcomeScreen(),
    );
  }
}
