import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/filtro/controller/filter_page_controller.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/custom_button.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

import 'widgets/custom_autocomplete_input.dart';
import 'widgets/custom_dropdown.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late FilterNameController _filterController; // Corrigido o nome do controller
  List<String> doctorNames = [];

  String? selectedSpecialty;
  String? selectedClinic;
  String? selectedLocation;
  String? selectedName;

  // Listas com opções para os filtros
  final List<String> specialties = [
    'Cardiologista',
    'Urologista',
    'Clínico Geral',
    'Dermatologista',
    'Ortopedista',
  ];

  final List<String> clinics = [
    'Clínica São João',
    'Clínica Bem Estar',
    'Centro Médico Saúde',
    'Hospital Vida',
    'Clínica Popular',
  ];

  final List<String> locations = [
    'São Paulo',
    'Rio de Janeiro',
    'Belo Horizonte',
    'Curitiba',
    'Salvador',
  ];

  // Função que limpa os filtros
  void clearFilters() {
    setState(() {
      selectedSpecialty = null;
      selectedClinic = null;
      selectedLocation = null;
      selectedName = null;
    });
  }

  @override
  void initState() {
    super.initState();
    final db = AppDatabase(); // cria instância do banco
    _filterController = FilterNameController(
      db.doctorDao,
    ); // passa pro controller
    _loadDoctorNames(); // carrega os nomes dos médicos
  }

  // Função assíncrona que busca nomes no banco
  Future<void> _loadDoctorNames() async {
    try {
      final names = await _filterController.getDoctorNames();
      print('==== Lista de nomes carregada ====');
      print(names);
      setState(() {
        doctorNames = names;
      });
    } catch (e, stack) {
      print('Erro ao carregar nomes: $e');
      print(stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(
              isCloseButton: true,
              iconColor: Color(0xFF0089FF),
            ),
            const SizedBox(height: 20),
            CustomAutocompleteInput(
              title: 'Localização',
              label: 'a localização',
              options: locations,
              selectedValue: selectedLocation,
              onChanged: (value) {
                setState(() => selectedLocation = value);
              },
            ),
            const SizedBox(height: 30),
            CustomAutocompleteInput(
              title: 'Nome',
              label: 'o nome do Médico',
              options: doctorNames, // Corrigido: doctorNamess → doctorNames
              selectedValue: selectedName,
              onChanged: (value) {
                setState(() => selectedName = value);
              },
            ),
            const SizedBox(height: 30),
            CustomDropdown(
              title: 'Especialidade',
              label: 'a especialidade do Médico',
              value: selectedSpecialty,
              items: specialties,
              onChanged: (value) {
                setState(() => selectedSpecialty = value);
              },
            ),
            const SizedBox(height: 30),
            CustomAutocompleteInput(
              title: 'Clínica',
              label: 'a clínica do Médico',
              options: clinics,
              selectedValue: selectedClinic,
              onChanged: (value) {
                setState(() => selectedClinic = value);
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: 'Limpar',
                  width: 149,
                  height: 51,
                  onPressed: clearFilters,
                ),
                CustomButton(
                  text: 'Aplicar filtros',
                  width: 149,
                  height: 51,
                  onPressed: () {
                    Navigator.pop(context, {
                      'specialty': selectedSpecialty,
                      'clinic': selectedClinic,
                      'location': selectedLocation,
                      'name': selectedName,
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
