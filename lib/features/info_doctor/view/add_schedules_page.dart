import 'package:app_mobile_clinica_medica/features/info_doctor/controller/infoDoctorController.dart';
import 'package:app_mobile_clinica_medica/features/info_doctor/view/widgets/input_int.dart';
import 'package:app_mobile_clinica_medica/features/info_doctor/view/widgets/weekday_selector.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/custom_button.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app_mobile_clinica_medica/features/info_doctor/view/info_doctor_page.dart';

class AddSchedulesPage extends StatefulWidget {
  final int CRM;
  final int uid;

  const AddSchedulesPage({super.key, required this.CRM, required this.uid});

  @override
  State<AddSchedulesPage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulesPage> {
  late AppDatabase _db;
  late InfoDoctorController _controller;

  // date to add a week
  DateTime selectedDate2 = DateTime.now().subtract(
    Duration(days: DateTime.now().weekday % 7),
  );
  int initTime = 0;
  int endTime = 0;
  List<String> week = [];
  List<DoctorSchedule>? scheduleList;

  @override
  void initState() {
    super.initState();
    _initAsync(); // Carrega os horários já existentes
  }

  Future<void> _initAsync() async {
    _db = await AppDatabase(); // <- inicialização segura
    _controller = InfoDoctorController(_db);
    await _loadInitialSchedules();
    setState(() {}); // atualiza a tela com os dados
  }

  Future<void> _loadInitialSchedules() async {
    final schedules = await _controller.getSchedule(widget.CRM);
    setState(() {
      scheduleList = schedules;
    });
  }

  Future<void> _newWeek(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate2) {
      final sunday = pickedDate.subtract(
        Duration(days: pickedDate.weekday % 7),
      );

      print("weekdays: $week");

      setState(() {
        selectedDate2 = sunday;
      });
    }
  }

  // modelo "HH:MM"
  String timeToString(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'MMMM d, yyyy',
    ).format(selectedDate2);

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
                Text(
                  'Selecione a semana: ',
                  style: TextStyle(
                    color: Color(0xFF0089FF),
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => _newWeek(context),
                      child: const Icon(
                        Icons.calendar_today,
                        size: 22,
                        color: Color(0xFF0089FF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Adicione o horário:',
                  style: TextStyle(
                    color: Color(0xFF0089FF),
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Das ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InputInt(
                      initialValue: initTime,
                      onChanged: (val) {
                        setState(() {
                          initTime = val ?? 0;
                        });
                      },
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'até ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InputInt(
                      initialValue: endTime,
                      onChanged: (val) {
                        setState(() {
                          endTime = val ?? 0;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Text(
                  'Selecione os dias das semana:',
                  style: TextStyle(
                    color: Color(0xFF0089FF),
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    WeekdaySelector(
                      initialSelected: week,
                      onChanged: (newSelection) {
                        setState(() {
                          week = newSelection;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    text: 'Adicionar Horários',
                    width: 200,
                    height: 50,
                    onPressed: () async {
                      // ação de submeter os horários
                      await _controller.addWeek(
                        widget.CRM,
                        selectedDate2,
                        initTime,
                        endTime,
                        week,
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => InfoDoctorPage(
                            CRM: widget.CRM,
                            uid: widget.uid,
                          ),
                        ),
                      );

                    },
                    styleType: ButtonStyleType.filled,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
