import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/login/view/login_page.dart';
import 'features/sing_up/view/sing_up_choose.dart';
import 'features/sing_up/view/sing_up_client.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: false,

      home: const LoginPage(), // <-- Aqui você define a tela que vai abrir
      //home: DashboardUser(), // <-- Aqui você define a tela que vai abrir
    );
  }
}
