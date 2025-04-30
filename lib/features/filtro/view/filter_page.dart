import 'package:app_mobile_clinica_medica/features/shered/widgets/custom_button.dart';
import 'package:app_mobile_clinica_medica/features/shered/widgets/header_close_back.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_autocomplete_input.dart';
import 'widgets/custom_dropdown.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedSpecialty;
  String? selectedClinic = '';
  String? selectedLocation = '';
  String? selectedName = '';

  final List<String> specialties = [
    'Cardiologista',
    'Urologista',
    'Clínico Geral',
    'Dermatologista',
    'Ortopedista',
  ];

  final List<String> doctors = [
    'Dr. Ana Souza',
    'Dr. Pedro Lima',
    'Dr. Mariana Torres',
    'Dr. Felipe Martins',
    'Dr. Camila Rocha',
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

  void clearFilters() {
    setState(() {
      selectedSpecialty = null;
      selectedClinic = '';
      selectedLocation = '';
      selectedName = '';
    });
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
              // Header with close button
              isCloseButton: true,
              iconColor: Color(0xFF0089FF),
            ),
            const SizedBox(height: 20),
            CustomAutocompleteInput(
              // Autocomplete input for location
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
              // Autocomplete input for doctor name
              title: 'Nome',
              label: 'o nome do Médico',
              options: doctors,
              selectedValue: selectedName,
              onChanged: (value) {
                setState(() => selectedName = value);
              },
            ),
            const SizedBox(height: 30),
            CustomDropdown(
              // Dropdown for specialty selection
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
              // Autocomplete input for clinic name
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
                  // Button to clear filters
                  text: 'Limpar',
                  width: 149,
                  height: 51,
                  onPressed: clearFilters,
                ),
                CustomButton(
                  // Button to apply filters
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
