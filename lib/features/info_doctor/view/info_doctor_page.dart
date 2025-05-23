import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Widgets personalizados
import 'package:app_mobile_clinica_medica/features/shared/widgets/doctor_card_image.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';
import 'package:app_mobile_clinica_medica/features/info_doctor/view/widgets/retangle_label.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/circle_icon.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/custom_button.dart';

class InfoDoctorPage extends StatefulWidget {
  final String CRM;

  final int uid;

  const InfoDoctorPage({super.key, required this.CRM, required this.uid});

  @override
  State<InfoDoctorPage> createState() => _InfoDoctorPageState();
}

class _InfoDoctorPageState extends State<InfoDoctorPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'MMMM d, yyyy',
    ).format(selectedDate);
    ;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(
                  isCloseButton: false,
                  iconColor: Color(0xFF0089FF),
                ),
                const SizedBox(height: 20),
                Center(
                  child: DoctorAvatar(
                    imageUrl: 'lib/images/default_profile.jpg',
                    radius: 50,
                    width: 190,
                    height: 190,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Dr. Kyle Bush (${widget.CRM})',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Cardiologist',
                    style: TextStyle(
                      color: Color(0xFF0089FF),
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Pacific Clinics',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: const Icon(
                        Icons.calendar_today,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Grid com scroll interno e altura fixa
                SizedBox(
                  height: 177, // Altura máxima visível do grid
                  child: Scrollbar(
                    // Adiciona uma barra de rolagem visual
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.3, // Ajusta tamanho horizontal
                      scrollDirection: Axis.vertical,
                      children: const [
                        RectangleLabel(label: '9:00 am'),
                        RectangleLabel(label: '10:30 am'),
                        RectangleLabel(label: '11:00 am'),
                        RectangleLabel(label: '12:30 pm'),
                        RectangleLabel(label: '4:00 pm'),
                        RectangleLabel(label: '6:00 pm'),
                        RectangleLabel(label: '6:30 pm'),
                        RectangleLabel(label: '7:00 pm'),
                        RectangleLabel(label: '7:30 pm'),
                        RectangleLabel(label: '8:00 pm'),
                        RectangleLabel(label: '9:00 pm'),
                        RectangleLabel(label: '9:30 pm'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Para centralizar os ícones
                    children: const [
                      CircleIcon(
                        icon: Icons.email,
                        color: Colors.white,
                        backgroundColor: Color(0xFF0089FF),
                      ),
                      SizedBox(width: 16), // Espaçamento entre os ícones
                      CircleIcon(
                        icon: Icons.phone,
                        color: Colors.white,
                        backgroundColor: Color(0xFF0089FF),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: CustomButton(
                    text: 'Set Location',
                    width: 200,
                    height: 50,
                    onPressed: () {
                      // ação de localização
                    },
                    styleType: ButtonStyleType.filled,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
