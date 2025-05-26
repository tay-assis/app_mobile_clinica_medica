// controller and database
import 'package:app_mobile_clinica_medica/features/login/view/login_page.dart';
import 'package:app_mobile_clinica_medica/features/profiles/controller/profiles_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// Widgets personalizados
import 'package:app_mobile_clinica_medica/features/shared/widgets/doctor_card_image.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';
import 'package:app_mobile_clinica_medica/features/info_doctor/view/widgets/retangle_label.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/circle_icon.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/custom_button.dart';
import '../../shared/widgets/slide_transition.dart';

class ProfilesPage extends StatefulWidget {
  final int uid;

  const ProfilesPage({super.key, required this.uid});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  late final AppDatabase _db;
  late final ProfilesController _controller;

  String? name;
  String? email;
  String? street;
  int? phone;
  String? type;

  Future<void> _loadUserdata() async {
    final user = await _controller.findUser(widget.uid);
    if (user != null) {
      final tipo = user.tipo;

      if (tipo == 'CLINIC') {
        final clinic = await _controller.findClinic(widget.uid);
        if (clinic != null) {
          final cName = await _controller.nameClinic(clinic);
          final cStreet = await _controller.streetClinic(clinic);
          final cPhone = await _controller.phoneClinic(clinic);
          setState(() {
            name = cName;
            street = cStreet;
            phone = cPhone;
          });
        }
      } else if (tipo == 'PATIENT') {
        final patient = await _controller.findPatient(widget.uid);
        if (patient != null) {
          final cName = await _controller.patientName(patient);
          final cStreet = await _controller.streetPatient(patient);
          setState(() {
            name = cName;
            street = cStreet;
            phone = null;
          });
        }
      }

      setState(() {
        type = user.tipo;
        email = user.email;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(
      context,
      listen: false,
    ); // agora sempre será a mesma instância
    _controller = ProfilesController(_db);
    _loadUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(
                  isCloseButton: false,
                  iconColor: Color(0xFF0089FF),
                ),
                //
                //
                //

                //Imagem
                const SizedBox(height: 20),
                Center(
                  child: DoctorAvatar(
                    imageUrl: 'lib/images/default_profile.jpg',
                    radius: 50,
                    width: 190,
                    height: 190,
                  ),
                ),

                // Nome
                const SizedBox(height: 30),
                Card(
                  color: Colors.grey[100],
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 55, 135, 255),
                    ),
                    title: Text(
                      '$name',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Email
                Card(
                  color: Colors.grey[100],
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 55, 135, 255),
                    ),
                    title: Text(
                      '$email',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Endereço
                Card(
                  color: Colors.grey[100],
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 55, 135, 255),
                    ),
                    title: Text(
                      '$street',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Telefone (se clínica)
                if (type == 'CLINIC') ...[
                  Card(
                    color: Colors.grey[100],
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 55, 135, 255),
                      ),
                      title: Text(
                        '$phone',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],

                // Botão "Sair"
                const SizedBox(height: 100),

                Center(
                  child: CustomButton(
                    text: 'Logout',
                    width: 200,
                    height: 50,
                    onPressed: () async {
                      await _controller.signOutUser();
                      navigateWithSlideTransition(
                        context: context,
                        destination: LoginPage(),
                        beginOffset: const Offset(1.0, 0.0),
                      );
                    },
                    styleType: ButtonStyleType.outlined,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
