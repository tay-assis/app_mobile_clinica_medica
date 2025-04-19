import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/login/controller/login_controller.dart';
import 'widgets/welcome_title.dart';
import '../../shered/widgets/logo_text.dart';
import 'widgets/field_label.dart';
import 'widgets/custom_button.dart';
import '../../shered/widgets/curved_header.dart';
import '../../shered/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  void dispose() {
    _controller.emailController.dispose();
    _controller.passwordController.dispose();
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Você clicou em "Cadastre-se agora"!',
                              ),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.blueAccent,
                            ),
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
