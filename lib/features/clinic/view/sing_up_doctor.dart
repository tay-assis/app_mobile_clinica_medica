import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/back_icon.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/slide_transition.dart';
import '../view/dashboard_clinic.dart';
import '../../shared/widgets/field_label.dart';
import '../../shared/widgets/sing_up_client_register.dart';
import '../../login/view/login_page.dart';
import '../controller/sing_up_doctor_controller.dart';

class SingUpDoctor extends StatefulWidget {
  const SingUpDoctor({super.key});

  @override
  State<SingUpDoctor> createState() => _SingUpDoctorState();
}

class _SingUpDoctorState extends State<SingUpDoctor> {
  final SingUpDoctorController _controller = SingUpDoctorController();

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
                  //navigateWithSlideTransition(
                  //  context: context,
                  //  destination: DashboardClinic(uid: uid),
                  //  beginOffset: const Offset(-1.0, 0.0),
                  //);
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            const Text(
              'Cadastre um novo médico',
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
              'Preencha as informações para concluir o cadastro',
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

            // Convênio
            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.centerLeft * 1.22,
              child: const FieldLabel(text: 'Convênio'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.convenioController,
                hintText: 'Digite o convênio',
                keyboardType: TextInputType.name,
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
                onPressed: () {
                  //Navigator.pushReplacement(
                  //  context,
                  //  MaterialPageRoute(
                  //    builder: (context) => DashboardClinic(),
                  //  ),
                  //);
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
