import 'package:app_mobile_clinica_medica/features/clinic/controller/dashboard_clinic_controller.dart';
import 'package:app_mobile_clinica_medica/features/clinic/view/sing_up_doctor.dart';
import 'package:app_mobile_clinica_medica/features/clinic/widgets/label.dart';
import 'package:app_mobile_clinica_medica/features/login/view/login_page.dart';
import 'package:app_mobile_clinica_medica/features/results/widgets/doctor_card.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/rectangle.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/retangle_result.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/bottom_nav_bar.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';

// Modelo simples do médico
class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;

  Doctor({required this.name, required this.specialty, required this.imageUrl});
}

// Página com a grade de médicos (agora Stateful)
class DashboardClinic extends StatefulWidget {
  final int uid;

  DashboardClinic({Key? key, required this.uid}) : super(key: key);

  @override
  State<DashboardClinic> createState() => _DashboardClinicState();
}

class _DashboardClinicState extends State<DashboardClinic> {
  late final AppDatabase _db;
  late final DashboardClinicController _controller;

  String? clinicName;
  String? clinicStreet;

  final List<Doctor> doctorsList = [
    Doctor(
      name: 'Dr. Kate Rose',
      specialty: 'Pediatra',
      imageUrl: 'lib/images/profile.jpg',
    ),
    Doctor(
      name: 'Dr. Kyle Bush',
      specialty: 'Cardiologista',
      imageUrl: 'https://placehold.co/130x116',
    ),
    Doctor(
      name: 'Dr. Casey Dean',
      specialty: 'Dermatologista',
      imageUrl: 'https://placehold.co/130x116',
    ),
    Doctor(
      name: 'Dr. Simon Le',
      specialty: 'Dermatologista',
      imageUrl: 'https://placehold.co/130x116',
    ),
  ];

  Future<void> _loadClinicData() async {
    print('DASHBOARD LOAD: ${widget.uid}');
    final clinic = await _controller.findClinic(widget.uid); //widget.uid

    if (clinic != null) {
      final name = await _controller.nameClinic(clinic);
      final street = await _controller.streetClinic(clinic);
      print('${clinic.userId}');
      print('\n $name, $street \n');

      setState(() {
        clinicName = name;
        clinicStreet = street;
      });
    } else {
      print('Clínica não encontrada');
    }
  }

  @override
  void initState() {
    super.initState();
    _db = AppDatabase(); // agora sempre será a mesma instância
    _controller = DashboardClinicController();
    _loadClinicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              // RETANGULO
              GradientRectangle(
                width: MediaQuery.of(context).size.width,
                height: 250,
              ),
              // TITULO E SUBTITULO
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        clinicName ?? 'Carregando nome',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        clinicStreet ?? 'Carregando endereço',
                        style: TextStyle(
                          color: Color.fromARGB(218, 255, 255, 255),
                          fontSize: 15,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SearchInputField(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              itemCount: doctorsList.length,
              itemBuilder: (context, index) {
                final doctor = doctorsList[index];
                return DoctorCard(
                  doctorName: doctor.name,
                  specialty: doctor.specialty,
                  imageUrl: doctor.imageUrl,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        showAddIcon: true,
        onAddTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SingUpDoctor()),
          );
        },
        onHomeTap: () {
          //Navigator.push(
          //  context,
          //  MaterialPageRoute(builder: (context) => DashboardClinic(uid: uid)),
          //);
        },
        onProfileTap: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}
