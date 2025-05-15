import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_mobile_clinica_medica/features/filtro/controller/filter_page_controller.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/custom_button.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';

import 'widgets/custom_autocomplete_input.dart';
import 'widgets/custom_dropdown.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedSpecialty;
  String? selectedClinic;
  String? selectedLocation;
  String? selectedName;

  @override
  void initState() {
    super.initState();
    // Inicia carregamento após primeiro frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FilterNameController>().loadDoctorsAndClinics();
    });
  }

  void clearFilters() {
    setState(() {
      selectedSpecialty = null;
      selectedClinic = null;
      selectedLocation = null;
      selectedName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FilterNameController>();

    if (controller.loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Quando carregado, controller.names possui a lista de nomes que se pede
    final doctorNames = controller.names;
    final doctorSpecialties = controller.specialties;
    final clinicNames = controller.clinicNames;
    final clinicAddresses = controller.addresses;
    // doctorNames usado na linha 104

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
              options: clinicAddresses,
              selectedValue: selectedLocation,
              onChanged: (v) => setState(() => selectedLocation = v),
            ),
            const SizedBox(height: 30),

            CustomAutocompleteInput(
              title: 'Nome',
              label: 'o nome do Médico',
              options: doctorNames,
              selectedValue: selectedName,
              onChanged: (v) => setState(() => selectedName = v),
            ),
            const SizedBox(height: 30),

            CustomDropdown(
              title: 'Especialidade',
              label: 'a especialidade do Médico',
              value: selectedSpecialty,
              items: doctorSpecialties,
              onChanged: (v) => setState(() => selectedSpecialty = v),
            ),
            const SizedBox(height: 30),

            CustomAutocompleteInput(
              title: 'Clínica',
              label: 'a clínica do Médico',
              options: clinicNames,
              selectedValue: selectedClinic,
              onChanged: (v) => setState(() => selectedClinic = v),
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
                  onPressed: () async {

                    // call your controller
                    final controller = context.read<FilterNameController>();
                    final List<int> filterResultList = await controller.applyFilters(
                      specialty: selectedSpecialty,
                      clinicName: selectedClinic,
                      location: selectedLocation,
                      doctorName: selectedName,
                    );


                    Navigator.pop(context,
                      // passando adiante a lista com os resultados do filtro
                    );
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
