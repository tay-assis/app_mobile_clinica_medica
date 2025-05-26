import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
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

class SingUpClinic extends StatefulWidget {
  final int uid;

  SingUpClinic({Key? key, required this.uid}) : super(key: key);

  @override
  State<SingUpClinic> createState() => _SingUpClinicState();
}

class _SingUpClinicState extends State<SingUpClinic> {
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
            const FieldLabel(
              text: 'Nome da Clinica',
              alignment: Alignment.centerLeft,
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.nomeCController,
                hintText: 'Digite o nome da Clínica',
                keyboardType: TextInputType.name,
              ),
            ),

            // Endereço
            SizedBox(height: height * 0.03),
            const FieldLabel(text: 'Endereço', alignment: Alignment.centerLeft),
            Center(
              child: SingUpClientRegister(
                controller: _controller.enderecoCController,
                hintText: 'Digite o endereço',
                keyboardType: TextInputType.streetAddress,
              ),
            ),

            SizedBox(height: height * 0.03),
            const FieldLabel(text: 'Bairro', alignment: Alignment.centerLeft),
            Center(
              child: SingUpClientRegister(
                controller: _controller.bairroCController,
                hintText: 'Digite o bairro',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            const FieldLabel(text: 'Cidade', alignment: Alignment.centerLeft),
            Center(
              child: SingUpClientRegister(
                controller: _controller.cidadeCController,
                hintText: 'Digite a cidade',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            const FieldLabel(text: 'Estado', alignment: Alignment.centerLeft),
            Center(
              child: SingUpClientRegister(
                controller: _controller.estadoCController,
                hintText: 'Digite o estado',
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(height: height * 0.03),
            const FieldLabel(text: 'CEP', alignment: Alignment.centerLeft),
            Center(
              child: SingUpClientRegister(
                controller: _controller.cepCController,
                hintText: 'Digite o CEP',
                keyboardType: TextInputType.numberWithOptions(decimal: false),
              ),
            ),

            SizedBox(height: height * 0.03),
            const FieldLabel(text: 'Telefone', alignment: Alignment.centerLeft),
            Center(
              child: SingUpClientRegister(
                controller: _controller.phoneCController,
                hintText: 'Digite o telefone',
                keyboardType: TextInputType.number,
              ),
            ),

            // Imagem URL
            SizedBox(height: height * 0.05),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                text: 'Submeter',
                width: width * 0.25,
                height: height * 0.04,
                onPressed: () async {
                  final success = await _controller.newClinic(widget.uid);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro finalizado com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    navigateWithSlideTransition(
                      context: context,
                      destination: const LoginPage(),
                      beginOffset: const Offset(1.0, 0.0),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro ao finalizar cadastro.'),
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
