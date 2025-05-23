import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
import 'package:app_mobile_clinica_medica/features/clinic/view/dashboard_clinic.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/login/controller/login_controller.dart';
import 'widgets/welcome_title.dart';
import '../../shared/widgets/logo_text.dart';
import '../../shared/widgets/field_label.dart';
import '../../shared/widgets/custom_button.dart'; // Botao de login
import '../../shared/widgets/curved_header.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../sing_up/view/sing_up_choose.dart';
import '../../shared/widgets/slide_transition.dart';

import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AppDatabase _db;
  late final LoginController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(context, listen: false);
    _controller = LoginController(_db);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Tira a resposividade ao ativar o telcado
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Header no topo
            const CurvedHeader(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateX(3.1416) // Inversão vertical
                      ..rotateY(3.1416), // Inversão horizontal
                child: const CurvedHeader(), // ou qualquer outro widget
              ),
            ),

            // Conteúdo principal com logo e formulário
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Espaço para a curva do header
                    SizedBox(height: height * 0.045),

                    // Logo por cima do header
                    const LogoText(),

                    // Título
                    SizedBox(height: height * 0.05),
                    const Center(child: WelcomeTitle()),

                    // Email
                    SizedBox(height: height * 0.1),
                    const FieldLabel(text: 'E-mail'),
                    Center(
                      child: CustomInputField(
                        controller: _controller.emailController,
                        hintText: 'Digite seu e-mail',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                    // Senha
                    SizedBox(height: height * 0.025),
                    const FieldLabel(text: 'Senha'),
                    Center(
                      child: CustomInputField(
                        controller: _controller.passwordController,
                        hintText: 'Digite sua senha',
                        obscureText: true,
                      ),
                    ),

                    // Link "Cadastre-se agora"
                    SizedBox(height: height * 0.05),
                    Align(
                      alignment:
                          Alignment.centerRight *
                          0.7, // ou topRight, bottomRight
                      child: FieldLabel(
                        text: 'Cadastre-se agora',
                        isLink: true,
                        onTap: () {
                          navigateWithSlideTransition(
                            context: context,
                            destination: const SingUpChoose(),
                            beginOffset: const Offset(
                              1.0,
                              0.0,
                            ), // entrada da direita
                          );
                        },
                      ),
                    ),

                    // Botão de login
                    SizedBox(height: height * 0.09),
                    Center(
                      child: CustomButton(
                        text: 'Login',
                        width: 149,
                        height: 51,
                        onPressed: () async {
                          final success = await _controller.checkUser();
                          final type = await _controller.userType();
                          final uid = await _controller.userUid();
                          print('LOGIN: $uid');
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login finalizado com sucesso!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            if (type == 'PATIENT' && uid != -1) {
                              navigateWithSlideTransition(
                                context: context,
                                destination: DashboardUser(uid: uid),
                                beginOffset: const Offset(1.0, 0.0),
                              );
                            }
                            if (type == 'CLINIC' && uid != -1) {
                              navigateWithSlideTransition(
                                context: context,
                                destination: DashboardClinic(uid: uid),
                                beginOffset: const Offset(1.0, 0.0),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Erro ao finalizar cadastro.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
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
