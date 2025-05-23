import 'package:app_mobile_clinica_medica/features/results/widgets/doctor_card.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/retangle_result.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:app_mobile_clinica_medica/features/results/controller/resultFilterController.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Página com a grade de médicos
class ResultFilter extends StatefulWidget {
  final List<int> doctorsCRMs;

  final int uid;

  ResultFilter({super.key, required this.doctorsCRMs, required this.uid});

  @override
  State<ResultFilter> createState() => _ResultFilterState();
}

class _ResultFilterState extends State<ResultFilter> {
  late final AppDatabase _db;
  late final ResultFilterController _controller;

  List<Doctor> _doctors = [];

  Future<void> _loadDoctors() async {
    final docs = await _controller.getDoctorsFromList(widget.doctorsCRMs);
    print('$docs');
    setState(() {
      _doctors = docs;
    });
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(context, listen: false);
    _controller = ResultFilterController(_db);
    _loadDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Cabeçalho com título e busca
          ResultRetangle(
            width: MediaQuery.of(context).size.width,
            height: 250,
            returnHome: true,
            uid: widget.uid,
          ),

          // Espaçamento entre o cabeçalho e a lista de médicos
          const SizedBox(height: 20),

          // Lista de médicos
          Expanded(
            child: GridView.builder(
              // Cria uma grade de médicos
              // com espaçamento entre os itens
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              // Exibe o widgets com a foto e a informação do médico
              // de acordo com a quantidade de médicos na lista
              itemCount: _doctors.length,
              itemBuilder: (context, index) {
                final doctor = _doctors[index];
                return DoctorCard(
                  doctorName: doctor.name,
                  specialty: 'Especialidade: ${doctor.specialty}',
                  imageUrl: 'lib/images/default_profile.jpg',
                  CRM: (doctor.crm).toString(),
                  uid: widget.uid,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
