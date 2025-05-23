//import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
import 'package:app_mobile_clinica_medica/features/results/view/filter_result.dart';
import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
//import 'package:app_mobile_clinica_medica/features/info_doctor/view/info_doctor_page.dart';
import 'package:app_mobile_clinica_medica/features/clinic/view/dashboard_clinic.dart';
import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
import 'package:app_mobile_clinica_medica/features/filter/view/filter_page.dart';
import 'package:app_mobile_clinica_medica/features/results/view/filter_result.dart';
import 'package:app_mobile_clinica_medica/features/login/view/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'features/login/view/login_page.dart';
//import 'features/sing_up/view/sing_up_choose.dart';
//import 'features/sing_up/view/sing_up_client.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:provider/provider.dart';
import 'sqlite/populate.dart';

// controllers
import 'package:app_mobile_clinica_medica/features/filter/controller/filter_page_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // GARANTIR QUE O FLUTTER INICIA ANTES DO FIREBASE
  await Firebase.initializeApp();

  // Seed and obtain your DB in one call
  final db = await DatabaseSeeder.seed();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: db),
        ChangeNotifierProvider(
          create: (_) => FilterNameController(db)..loadDoctorsAndClinics(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: false,

      //home: ResultFilter(doctorsCRMs: [345, 234],uid: 2,), // <-- Aqui você define a tela que vai abrir
      //home: const LoginPage(), // <-- Aqui você define a tela que vai abrir
      //home: DashboardUser(), // <-- Aqui você define a tela que vai abrir
      //home: DashboardClinic(), // <-- Aqui você define a tela que vai abrir
      //home: InfoDoctorPage(), // <-- Aqui você define a tela que vai abrir
      //home: ResultFilter(),     // <-- Aqui você define a tela que vai abrir
      //home: const DashboardClinic(), // <-- Aqui você define a tela que vai abrir
      home: LoginPage(), // <-- Aqui você define a tela que vai abrir
      //home: DashboardUser(),    // <-- Aqui você define a tela que vai abrir
    );
  }
}
