import 'package:app_mobile_clinica_medica/features/clinic/controller/dashboard_clinic_controller.dart';
import 'package:app_mobile_clinica_medica/features/clinic/view/sing_up_doctor.dart';
import 'package:app_mobile_clinica_medica/features/clinic/widgets/label.dart';
import 'package:app_mobile_clinica_medica/features/login/view/login_page.dart';
import 'package:app_mobile_clinica_medica/features/profiles/view/profiles_page.dart';
import 'package:app_mobile_clinica_medica/features/results/widgets/doctor_card.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/rectangle.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/retangle_result.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/bottom_nav_bar.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  List<Doctor> _doctors = [];

  Future<void> _loadClinicData() async {
    final clinic = await _controller.findClinic(widget.uid); //widget.uid

    if (clinic != null) {
      final name = await _controller.nameClinic(clinic);
      final street = await _controller.streetClinic(clinic);
      final docs = await _controller.findDoctor(clinic);
      setState(() {
        clinicName = name;
        clinicStreet = street;
        if (docs != null) {
          _doctors = docs;
        }
      });
    } else {
      print('Clínica não encontrada');
    }
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(
      context,
      listen: false,
    ); // agora sempre será a mesma instância
    _controller = DashboardClinicController(_db);
    _loadClinicData();
    //_loadDoctors();
  }

  //void _loadDoctors() async {
  //  final clinic = await _controller.findClinic(widget.uid);
  //  final docs = await _controller.findDoctor(clinic);
  //  if (docs != null) {
  //    print('LOAD: $docs');
  //    setState(() {
  //      _doctors = docs;
  //      print('STSTATE: $_doctors');
  //    });
  //  }
  //}

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
              itemCount: _doctors.length,
              itemBuilder: (context, index) {
                final doctor = _doctors[index];
                return DoctorCard(
                  doctorName: doctor.name,
                  specialty: doctor.specialty,
                  imageUrl: 'lib/images/default_profile.jpg',
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
            MaterialPageRoute(
              builder: (context) => SingUpDoctor(uid: widget.uid),
            ),
          );
        },
        onHomeTap: () {
          //Navigator.push(
          //  context,
          //  MaterialPageRoute(builder: (context) => DashboardClinic(uid: uid)),
          //);
        },
        onProfileTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilesPage(uid: widget.uid),
            ),
          );
        },
      ),
    );
  }
}
