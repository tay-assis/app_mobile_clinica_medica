import 'package:flutter/material.dart';
import '../../login/view/login_page.dart';
import '../../shered/widgets/curved_header.dart';
import '../../shered/widgets/logo_text.dart';
import '../../shered/widgets/custom_button.dart'; // Botao cliente/usuario
import 'dart:io';

class SignUpChoose extends StatelessWidget {
  const SignUpChoose({super.key});

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
            // Header no topo
            const CurvedHeader(),

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

                    // Logo por cima do header
                    const LogoText(),

                    // Texto 1
                    SizedBox(height: height * 0.07),
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
                            text: 'Cliente',
                            width: 170,
                            height: 50,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Login'),
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.blueAccent,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 20,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Login'),
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.blueAccent,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Imagem
                    //SizedBox(height: height * 0.0005),
                    Center(
                      child: Image.asset(
                        'lib/images/sing_up_choose_image.png',
                        width: 350,
                        height: 350,
                        //fit: BoxFit.cover,
                      ),
                    ),

                    // Botao da volta
                    //SizedBox(height: height * 0.005),
                    Align(
                      alignment:
                          Alignment.centerRight *
                          0.95, // ou topRight, bottomRight
                      child: CustomButton(
                        text: 'Voltar',
                        width: 137,
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      LoginPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                const begin = Offset(
                                  -1.0,
                                  0.0,
                                ); // Tela entra da direita
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        styleType: ButtonStyleType.outlined,
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
