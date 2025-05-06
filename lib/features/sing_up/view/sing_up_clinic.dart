import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/back_icon.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/slide_transition.dart';
import '../view/sing_up_choose.dart';
import '../../shared/widgets/field_label.dart';
import '../../shared/widgets/sing_up_client_register.dart';
import '../../login/view/login_page.dart';
import '../controller/sing_up_controller.dart';

class SingUpClinic extends StatefulWidget {
  const SingUpClinic({super.key});

  @override
  State<SingUpClinic> createState() => _SingUpClientState();
}

class _SingUpClientState extends State<SingUpClinic> {
  final SingUpController _controller = SingUpController();

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
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(text: 'Nome Clínica'),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.nomeController,
                hintText: 'Digite o nome da Clínica',
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
                controller: _controller.enderecoController,
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
                controller: _controller.enderecoController,
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
                controller: _controller.enderecoController,
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
                controller: _controller.enderecoController,
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
                controller: _controller.enderecoController,
                hintText: 'Digite o CEP',
                keyboardType: TextInputType.name,
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
                onPressed: () {
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
