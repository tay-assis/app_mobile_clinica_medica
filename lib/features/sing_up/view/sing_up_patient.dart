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

  // insurance variables
  String? _selectedInsurance;
  bool isOtherInsurance = false;
  bool isSelected = false;
  //TextEditingController _otherInsuranceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(context, listen: false);
    _controller = SingUpController(_db);
  }

  @override
  void dispose() {
    //_otherInsuranceController.dispose();
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

            //Convênio
            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Convênio'),
            ),
            FutureBuilder<List<String>>(
              future: _controller.getInsurancesName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Erro ao carregar convênios: ${snapshot.error}',
                    ),
                  );
                }

                final insuranceNames = snapshot.data ?? [];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdown(
                      //title: 'Insurance',
                      label: 'insurance',
                      value: isOtherInsurance ? null : _selectedInsurance,
                      items: insuranceNames,
                      onChanged: (value) {
                        if (!isOtherInsurance) {
                          setState(() {
                            _selectedInsurance = value;
                          });
                          print('Convênio selecionado: $_selectedInsurance');
                          isSelected =
                              value != null &&
                              value.isNotEmpty; //returning true
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: isOtherInsurance,
                          onChanged: (value) {
                            setState(() {
                              isOtherInsurance = value ?? false;

                              if (!isOtherInsurance) {
                                //mudei controller
                                _controller.convenioController.clear();
                                isSelected =
                                    _selectedInsurance != null &&
                                    _selectedInsurance!.isNotEmpty;
                              } else {
                                //mudei controller
                                _selectedInsurance =
                                    _controller.convenioController.text;
                                isSelected = false;
                              }
                            });
                          },
                        ),
                        const Text(
                          'Outro',
                          style: TextStyle(fontFamily: 'Nunito', fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        if (isOtherInsurance)
                          Expanded(
                            child: TextFormField(
                              controller: _controller.convenioController,
                              onChanged: (text) {
                                setState(() {
                                  _selectedInsurance = text;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Digite o nome do convênio',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                );
              },
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
                    _selectedInsurance!,
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
