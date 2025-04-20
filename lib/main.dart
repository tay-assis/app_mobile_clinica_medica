import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
import 'package:flutter/material.dart';
import 'features/login/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: false,
      //home: const LoginPage(), // <-- Aqui você define a tela que vai abrir
      home: const DashboardUser(), // <-- Aqui você define a tela que vai abrir
    );
  }
}
