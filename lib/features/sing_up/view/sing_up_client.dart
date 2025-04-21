import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/shered/widgets/back_icon.dart';
import '../../shered/widgets/custom_button.dart';
import '../../shered/widgets/slide_transition.dart';
import '../view/sing_up_choose.dart';
import '../../shered/widgets/field_label.dart';
import '../../shered/widgets/sing_up_client_register.dart';
import '../../login/view/login_page.dart';

class SingUpClient extends StatefulWidget {
  const SingUpClient({super.key});

  @override
  State<SingUpClient> createState() => _SingUpClientState();
}

class _SingUpClientState extends State<SingUpClient> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.045),

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

              // Nome
              SizedBox(height: height * 0.05),
              Align(
                alignment: Alignment.centerLeft * 1.2,
                child: FieldLabel(text: 'Nome'),
              ),
              Center(
                child: SingUpClientRegister(
                  controller: nomeController,
                  hintText: 'Digite seu nome completo',
                  keyboardType: TextInputType.name,
                ),
              ),

              // CPF
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft * 1.2,
                child: FieldLabel(text: 'CPF'),
              ),
              Center(
                child: SingUpClientRegister(
                  controller: emailController,
                  hintText: 'Digite seu CPF',
                  keyboardType: TextInputType.number,
                ),
              ),

              // Senha
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft * 1.2,
                child: FieldLabel(text: 'Senha'),
              ),
              Center(
                child: SingUpClientRegister(
                  controller: emailController,
                  hintText: 'Digite sua senha',
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),

              // Email
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft * 1.2,
                child: FieldLabel(text: 'Email'),
              ),
              Center(
                child: SingUpClientRegister(
                  controller: emailController,
                  hintText: 'Digite seu e-mail',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              // Convenio
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft * 1.2,
                child: FieldLabel(text: 'Convênio'),
              ),
              Center(
                child: SingUpClientRegister(
                  controller: emailController,
                  hintText: 'Digite seu Convênio',
                  keyboardType: TextInputType.name,
                ),
              ),

              SizedBox(height: height * 0.03),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: 'Submeter',
                  width: 100,
                  height: 35,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  styleType: ButtonStyleType.outlined, // modelo 2
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
