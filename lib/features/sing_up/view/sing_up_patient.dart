import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/back_icon.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/slide_transition.dart';
import '../view/sing_up_choose.dart';
import '../../shared/widgets/field_label.dart';
import '../../shared/widgets/sing_up_client_register.dart';
import '../../login/view/login_page.dart';
import '../controller/sing_up_controller.dart';

import 'widgets/custom_dropdown.dart';

class SingUpPatient extends StatefulWidget {
  final int uid;

  SingUpPatient({Key? key, required this.uid}) : super(key: key);

  @override
  State<SingUpPatient> createState() => _SingUpPatientState();
}

class _SingUpPatientState extends State<SingUpPatient> {
  late final AppDatabase _db;
  late final SingUpController _controller;

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(context, listen: false);
    _controller = SingUpController(_db);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(text: label),
        Center(
          child: SingUpClientRegister(
            controller: controller,
            hintText: hint,
            keyboardType: keyboardType,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final allInsurances = _controller.insurances;

    // insurance variables
    bool isOtherInsurance = false;
    bool isSelected = false;
    String newInsurance = '';

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: ListView(
          children: [
            // Seta para
            SizedBox(height: height * 0.001),
            Align(
              alignment: Alignment.centerRight * 0.7,
              child: BackIcon(
                onTap: () {
                  navigateWithSlideTransition(
                    context: context,
                    destination: const SingUpChoose(),
                    beginOffset: const Offset(-1.0, 0.0),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            const Text(
              'Quase lá...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                height: 1.24,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Preencha as informações necessárias para completarmos seu cadastro',
              style: TextStyle(
                color: Colors.black.withAlpha(153),
                fontSize: 17,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: height * 0.05),

            // Nome
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Nome'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.nomePController,
                hintText: 'Digite seu nome completo',
                keyboardType: TextInputType.name,
              ),
            ),

            // Telefone
            //SizedBox(height: height * 0.03),
            //Align(
            //alignment: Alignment.centerLeft * 1.2,
            //child: const FieldLabel(text: 'Telefone'),
            //),
            //Center(
            //child: SingUpClientRegister(
            // controller: _controller.telefoneController,
            //hintText: 'Digite seu telefone',
            //keyboardType: TextInputType.number,
            //),
            //),

            // Convênio
            // Dropdown de convênios (mostrado apenas se não for "Outro")
            if (!isOtherInsurance)
              CustomDropdown(
                title: 'Convênio',
                label: 'Convênio do paciente',
                value: newInsurance,
                items: allInsurances,
                onChanged: (v) {
                  setState(() {
                    newInsurance = v!;
                  });
                },
              ),

            const SizedBox(height: 20),

            // Checkbox "Outro convênio"
            Row(
              children: [
                Checkbox(
                  value: isOtherInsurance,
                  onChanged: (bool? value) {
                    setState(() {
                      isOtherInsurance = value ?? false;

                      if (isOtherInsurance) {
                        isSelected = false; // limpa seleção do dropdown
                      } else {
                        _controller.convenioController
                            .clear(); // limpa campo de texto
                      }
                    });
                  },
                ),
                const Text('Outro convênio'),
              ],
            ),

            const SizedBox(height: 10),

            // Campo de texto para novo convênio (visível só se "Outro" estiver marcado)
            if (isOtherInsurance)
              TextField(
                controller: _controller.convenioController,
                decoration: const InputDecoration(
                  labelText: 'Nome do novo convênio',
                  border: OutlineInputBorder(),
                ),
              ),

            // Endereço
            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Endereço'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.enderecoPController,
                hintText: 'Digite o endereço',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Bairro'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.bairroPController,
                hintText: 'Digite o bairro',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Cidade'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.cidadePController,
                hintText: 'Digite a cidade',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Estado'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.estadoPController,
                hintText: 'Digite o estado',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'CEP'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.cepPController,
                hintText: 'Digite o CEP',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.05),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                text: 'Submeter',
                width: width * 0.25,
                height: height * 0.04,
                onPressed: () async {
                  final success = await _controller.newPatient(
                    widget.uid,
                    isOtherInsurance,
                    isSelected,
                    newInsurance,
                  );
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    navigateWithSlideTransition(
                      context: context,
                      destination: LoginPage(),
                      beginOffset: const Offset(1.0, 0.0),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro ao realizar cadastro.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                styleType: ButtonStyleType.outlined,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
