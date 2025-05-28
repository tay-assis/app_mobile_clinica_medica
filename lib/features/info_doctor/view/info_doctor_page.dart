// controller and database
import 'package:app_mobile_clinica_medica/features/info_doctor/controller/infoDoctorController.dart';
import 'package:app_mobile_clinica_medica/features/info_doctor/view/add_schedules_page.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/circle_icon.dart';
//import 'package:app_mobile_clinica_medica/features/info_doctor/view/widgets/weekday_selector.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:provider/provider.dart';
//import 'package:app_mobile_clinica_medica/features/clinic/controller/dashboard_clinic_controller.dart';
import 'package:intl/intl.dart';

// Widgets personalizados
import 'package:app_mobile_clinica_medica/features/shared/widgets/doctor_card_image.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';
import 'package:app_mobile_clinica_medica/features/info_doctor/view/widgets/rectangle_label.dart';

class InfoDoctorPage extends StatefulWidget {
  final int CRM;
  final int uid;

  const InfoDoctorPage({super.key, required this.CRM, required this.uid});

  @override
  State<InfoDoctorPage> createState() => _InfoDoctorPageState();
}

class _InfoDoctorPageState extends State<InfoDoctorPage> {
  late final AppDatabase _db;
  late final InfoDoctorController _controller;

  // date to show on screen
  DateTime selectedDate = DateTime.now();

  String? doctorName;
  String? doctorSpecialty;
  String? clinicName;
  List<DoctorSchedule>? scheduleList;
  String? userType;

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

  // modelo "HH:MM"
  String timeToString(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _loadDoctorData() async {
    final doctor = await _controller.getDoctorFromCrm(widget.CRM);
    final clinic = await _controller.getClinicName(widget.CRM);
    final List<DoctorSchedule>? schedules = await _controller.getSchedule(
      widget.CRM,
    );
    final user_type = await _controller.getUserType(widget.uid);

    if (doctor != null) {
      setState(() {
        doctorName = doctor.name;
        doctorSpecialty = doctor.specialty;
      });
    } else {
      print('Doutor não encontrado');
    }

    print('doutor nao  nulo ');
    if (clinic != null) {
      print('clinica nao nula');
      setState(() {
        clinicName = clinic.name;
      });
    }

    if (schedules != null) {
      print('agenda nao nula');
      setState(() {
        scheduleList = schedules;
      });
    }

    setState(() {
      userType = user_type;
    });
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(
      context,
      listen: false,
    ); // agora sempre será a mesma instância
    _controller = InfoDoctorController(_db);
    _loadDoctorData();
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'MMMM d, yyyy',
    ).format(selectedDate);

    List<Widget> rectList = [];

    // still loading
    if (scheduleList == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (scheduleList!.isNotEmpty) {

      /// IF CLINIC, SHOW ALL SCHEDULED TIMES AND ALLOW AVAILABILITY INVERSION
      if(userType == "CLINIC")
      {
        // filtered for the selected day
        final todaySchedules = scheduleList!
            .where((s) => s.date.year  == selectedDate.year
            && s.date.month == selectedDate.month
            && s.date.day   == selectedDate.day)
            .toList();

        // add results to the Widget List
        if (todaySchedules.isNotEmpty) {
          for(int i=0; i<todaySchedules.length;i++)
          {
            rectList.add(
              // this gesture detector should only be applied if user.type == clinic
              GestureDetector(
                onTap: () async {

                  await _controller.invertAvailability(todaySchedules[i]);

                  // new value
                  final freshSchedules = await _controller.getSchedule(widget.CRM);
                  setState(() {
                    scheduleList = freshSchedules;
                  });
                },
                child: RectangleLabel(
                  label: timeToString(todaySchedules[i].date),
                  isAvailable: (todaySchedules[i].status == "available"),
                ),
              ),
            );
          }
        }
      }
      else
      {
        /// IF PATIENT, SHOW ONLY UNSCHEDULED TIMES AND DENY AVAILABILITY INVERSION
        if(userType == "PATIENT")
        {
          // filtered for the selected day
          final todaySchedules = scheduleList!
              .where((s) => s.date.year  == selectedDate.year
              && s.date.month == selectedDate.month
              && s.date.day   == selectedDate.day
              && s.status == "available")
              .toList();

          // add results to the Widget List
          if (todaySchedules.isNotEmpty) {
            for(int i=0; i<todaySchedules.length;i++)
            {
              rectList.add(
                RectangleLabel(
                  label: timeToString(todaySchedules[i].date),
                  isAvailable: (todaySchedules[i].status == "available"),
                ),
              );
            }
          }
        }
      }
    }



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader( // removed const for uid
                  isCloseButton: false,
                  iconColor: const Color(0xFF0089FF),
                  returnHome: true,
                  uid: widget.uid,
                  isClinic: userType=="CLINIC",
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
                    '$doctorName: (${widget.CRM})',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    '$doctorSpecialty',
                    style: TextStyle(
                      color: Color(0xFF0089FF),
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '$clinicName',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 16),
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
                      children:
                          /// list with all the available schedules
                          rectList,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if(userType == "CLINIC")...[
                  Center(
                    child: IconButton(
                      icon: CircleIcon(
                        icon: Icons.add,
                        color: Color(0xFFFFFFFF),
                        backgroundColor: Color(0xFF0089FF),
                      ),
                      onPressed: () {
                        // ação para navegar para a página de agendamento
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => AddSchedulesPage(
                              CRM: widget.CRM,
                              uid: widget.uid,
                            ),
                          ),
                        );
                      },
                      color: Color(0xFF0089FF),
                      iconSize: 30,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
