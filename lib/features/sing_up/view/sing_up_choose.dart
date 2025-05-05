import 'package:app_mobile_clinica_medica/features/shared/widgets/back_icon.dart';
import 'package:flutter/material.dart';
import '../../login/view/login_page.dart';
import '../../shared/widgets/curved_header.dart';
import '../../shared/widgets/custom_button.dart'; // Botao cliente/usuario
import '../../shared/widgets/slide_transition.dart';
import '../view/sing_up_client.dart';
import '../view/sing_up_clinic.dart';

class SingUpChoose extends StatelessWidget {
  const SingUpChoose({super.key});

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
            // Footer espelhado
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateX(3.1416) // Espelha verticalmente
                      ..rotateY(3.1416), // Espelha horizontalmente
                child: const CurvedHeader(),
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

                    // Seta para voltar
                    Align(
                      alignment: Alignment.centerRight * 0.7,
                      child: BackIcon(
                        onTap: () {
                          navigateWithSlideTransition(
                            context: context,
                            destination: const LoginPage(),
                            beginOffset: const Offset(
                              -1.0,
                              0.0,
                            ), // entrada da direita
                          );
                        },
                      ),
                    ),

                    // Texto 1
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

                    // Texto 2
                    SizedBox(height: height * 0.02),
                    Text(
                      'Escolha o que você deseja cadastrar',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 153),
                        fontSize: 17,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // Botoes
                    SizedBox(height: height * 0.07),
                    Center(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center, // Alinha os botões no centro horizontal
                        children: [
                          //.
                          //.
                          //.
                          // Botão de Cliente
                          CustomButton(
                            text: 'Paciente',
                            width: 170,
                            height: 50,
                            onPressed: () {
                              navigateWithSlideTransition(
                                context: context,
                                destination: const SingUpClient(),
                                beginOffset: const Offset(
                                  1.0,
                                  0.0,
                                ), // entrada da direita
                              );
                            },
                          ),
                          SizedBox(
                            width: width * 0.014,
                          ), // Espaçamento horizontal entre os botões
                          //.
                          //.
                          //.
                          // Botão de Clinica
                          CustomButton(
                            text: 'Clinica',
                            width: 170,
                            height: 50,
                            onPressed: () {
                              navigateWithSlideTransition(
                                context: context,
                                destination: const SingUpClinic(),
                                beginOffset: const Offset(
                                  1.0,
                                  0.0,
                                ), // entrada da direita
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Imagem
                    SizedBox(height: height * 0.03),
                    Center(
                      child: Image.asset(
                        'lib/images/sing_up_choose_image.png',
                        width: width * 0.8,
                        height: height * 0.3,
                        //fit: BoxFit.cover,
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
