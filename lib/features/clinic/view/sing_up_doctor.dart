import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/back_icon.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/slide_transition.dart';
import '../view/dashboard_clinic.dart';
import '../../shared/widgets/field_label.dart';
import '../../shared/widgets/sing_up_client_register.dart';
import '../../login/view/login_page.dart';

import '../controller/sing_up_doctor_controller.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingUpDoctor extends StatefulWidget {
  final int uid;

  SingUpDoctor({Key? key, required this.uid}) : super(key: key);

  @override
  State<SingUpDoctor> createState() => _SingUpDoctorState();
}

class _SingUpDoctorState extends State<SingUpDoctor> {
  late final AppDatabase _db;
  late final SingUpDoctorController _controller;

  int? clinicId;

  void _loadClinic() async {
    final cid = await _controller.findCid(
      widget.uid,
    ); //finding clinic by userId
    if (cid != null) {
      setState(() {
        clinicId = cid;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(
      context,
      listen: false,
    ); // agora sempre será a mesma instância
    _controller = SingUpDoctorController(_db);
    _loadClinic();
    //_loadDoctors();
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
                    destination: DashboardClinic(uid: widget.uid),
                    beginOffset: const Offset(-1.0, 0.0),
                  );
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

            // CRM
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(
                text: 'CRM',
                alignment: Alignment.centerLeft,
              ),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.crmController,
                hintText: 'Digite o CRM do médico',
                keyboardType: TextInputType.name,
              ),
            ),

            // Nome
            SizedBox(height: height * 0.04),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(
                text: 'Nome',
                alignment: Alignment.centerLeft,
              ),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.nomeController,
                hintText: 'Digite o nome completo do médico',
                keyboardType: TextInputType.name,
              ),
            ),

            // Especialidade
            SizedBox(height: height * 0.04),
            Align(
              alignment: Alignment.centerLeft * 1.2,
              child: const FieldLabel(
                text: 'Especialidade',
                alignment: Alignment.centerLeft,
              ),
            ),
            Center(
              child: SingUpClientRegister(
                controller: _controller.especialidadeController,
                hintText: 'Digite a especialidade do médico',
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
                  final crm = await _controller.newDoctor(clinicId);
                  if (crm != -1 && crm != -2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardClinic(uid: widget.uid),
                      ),
                    );
                  } else {
                    if (crm != -2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao realizar cadastro.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Já existe um médico com esse crm'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
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
