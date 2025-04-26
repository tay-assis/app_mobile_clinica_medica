import 'package:app_mobile_clinica_medica/features/login/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_autocomplete_input.dart';
import 'widgets/custom_dropdown.dart';

class FiltroPage extends StatefulWidget {
  const FiltroPage({super.key});

  @override
  State<FiltroPage> createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage> {
  String? especialidadeSelecionada;
  String? clinicaSelecionada = '';
  String? localizacaoSelecionada = '';
  String? nomeSelecionado = '';

  final List<String> especialidades = [
    'Cardiologista',
    'Urologista',
    'Clínico Geral',
    'Dermatologista',
    'Ortopedista',
  ];

  final List<String> doctors = [
    'Dr. Ana Souza',
    'Dr. Pedro Lima',
    'Dra. Mariana Torres',
    'Dr. Felipe Martins',
    'Dra. Camila Rocha',
  ];

  final List<String> clinicas = [
    'Clínica São João',
    'Clínica Bem Estar',
    'Centro Médico Saúde',
    'Hospital Vida',
    'Clínica Popular',
  ];

  final List<String> localizacoes = [
    'São Paulo',
    'Rio de Janeiro',
    'Belo Horizonte',
    'Curitiba',
    'Salvador',
  ];

  void limparFiltros() {
    setState(() {
      especialidadeSelecionada = null;
      clinicaSelecionada = '';
      localizacaoSelecionada = '';
      nomeSelecionado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        // title: const Text(
        //   'Filtro',
        //   style: TextStyle(
        //     fontSize: 22,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 30, color: Color(0xFF0089FF)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomAutocompleteInput(
              label: 'Localização',
              options: localizacoes,
              selectedValue: localizacaoSelecionada,
              onChanged: (value) {
                setState(() => localizacaoSelecionada = value);
              },
            ),
            const SizedBox(height: 30),
            CustomAutocompleteInput(
              label: 'Nome',
              options: doctors,
              selectedValue: nomeSelecionado,
              onChanged: (value) {
                setState(() => nomeSelecionado = value);
              },
            ),
            const SizedBox(height: 30),
            CustomDropdown(
              title: 'Especialidade',
              value: especialidadeSelecionada,
              items: especialidades,
              onChanged: (value) {
                setState(() => especialidadeSelecionada = value);
              },
            ),
            const SizedBox(height: 30),
            CustomAutocompleteInput(
              label: 'Clínica',
              options: clinicas,
              selectedValue: clinicaSelecionada,
              onChanged: (value) {
                setState(() => clinicaSelecionada = value);
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
                  onPressed: limparFiltros,
                ),
                CustomButton(
                  text: 'Aplicar filtros',
                  width: 149,
                  height: 51,
                  onPressed: () {
                    Navigator.pop(context, {
                      'especialidade': especialidadeSelecionada,
                      'clinica': clinicaSelecionada,
                      'localizacao': localizacaoSelecionada,
                      'nome': nomeSelecionado,
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
