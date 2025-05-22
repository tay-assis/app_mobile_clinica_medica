import 'package:app_mobile_clinica_medica/features/shared/widgets/back_icon.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/sing_up/controller/sing_up_controller.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

import '../../login/view/login_page.dart';
import '../../shared/widgets/curved_header.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/slide_transition.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/field_label.dart';
import 'sing_up_patient.dart';
import '../view/sing_up_clinic.dart';

class SingUpChoose extends StatefulWidget {
  const SingUpChoose({super.key});

  @override
  State<SingUpChoose> createState() => _SingUpChooseState();
}

class _SingUpChooseState extends State<SingUpChoose> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateX(3.1416)
                      ..rotateY(3.1416),
                child: const CurvedHeader(),
              ),
            ),
            SingleChildScrollView(
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
                            destination: const LoginPage(),
                            beginOffset: const Offset(-1.0, 0.0),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Text(
                      'Bem vindo ao\nDoctor On',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        height: 1.24,
                      ),
                    ),
                    SizedBox(height: height * 0.1),
                    const FieldLabel(text: 'E-mail'),
                    Center(
                      child: CustomInputField(
                        controller: _controller.emailController,
                        hintText: 'Digite seu e-mail',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const FieldLabel(text: 'Senha'),
                    Center(
                      child: CustomInputField(
                        controller: _controller.passwordController,
                        hintText: 'Digite sua senha',
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Escolha o que você deseja cadastrar',
                      style: TextStyle(
                        color: Colors.black.withAlpha(153),
                        fontSize: 17,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: height * 0.07),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            text: 'Paciente',
                            width: 170,
                            height: 50,
                            onPressed: () async {
                              final uid = await _controller.newUser('PATIENT');
                              if (uid != -1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Cadastro realizado com sucesso!',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                navigateWithSlideTransition(
                                  context: context,
                                  destination: SingUpPatient(uid: uid),
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
                            },
                          ),
                          SizedBox(width: width * 0.014),
                          CustomButton(
                            text: 'Clinica',
                            width: 170,
                            height: 50,
                            onPressed: () async {
                              final email =
                                  _controller.emailController.text.trim();
                              final password =
                                  _controller.passwordController.text.trim();

                              final uid = await _controller.newUser('CLINIC');
                              if (uid != -1) {
                                // if user created
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Cadastro realizado com sucesso!',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                navigateWithSlideTransition(
                                  context: context,
                                  destination: SingUpClinic(uid: uid),
                                  beginOffset: const Offset(1.0, 0.0),
                                );
                              } else {
                                if (!_controller.isValidEmail(email)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Email inválido'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (!_controller.isValidPassword(
                                  password,
                                )) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Senha inválida'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Center(
                      child: Image.asset(
                        'lib/images/sing_up_choose_image.png',
                        width: width * 0.8,
                        height: height * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
