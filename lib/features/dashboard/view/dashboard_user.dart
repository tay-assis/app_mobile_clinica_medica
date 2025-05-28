import 'package:app_mobile_clinica_medica/features/dashboard/controller/dashboard_user_controller.dart';
import 'package:app_mobile_clinica_medica/features/profiles/view/profiles_page.dart';
import 'package:app_mobile_clinica_medica/features/dashboard/view/widgets/main_rectangle.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/user_header.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/widgets/bottom_nav_bar.dart';

class DashboardUser extends StatefulWidget {
  final int uid;

  const DashboardUser({Key? key, required this.uid}) : super(key: key);

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  late final AppDatabase _db;
  late final DashboardUserController _controller;

  String? patientName;
  String? patientEmail;

  Future<void> _loadUser() async {
    final user = await _controller.findPatient(widget.uid);

    if (user != null) {
      final name = await _controller.patientName(user);
      final email = await _controller.patientEmail(widget.uid);

      setState(() {
        patientName = name;
        patientEmail = email;
      });
    } else {
      print('Usuário não encontrado');
    }
  }

  @override
  void initState() {
    super.initState();
    _db = Provider.of<AppDatabase>(context, listen: false);
    _controller = DashboardUserController(_db);
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserHeader(
                //ESSES DADOS SERAO IMPORTADOS DO BACK-END
                //DEVEMOS IMPORTAR IMAGENS???
                name: patientName ?? 'Carregando nome',
                subtitle: patientEmail ?? 'Carregando email',
              ), // Header with user information like name and profile picture
              SizedBox(height: 20),
              MainRectangle(
                width: 373,
                height: 250,
                uid: widget.uid,
              ), // Main rectangle with gradient background and icons
              // others widgets can be added here, example images, health tips, etc.
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        showAddIcon: true,
        selectedIndex: 0, // This is home page, so index is 0
        isDashboardUser: true,
        onAddTap: () {
          Navigator.pushNamed(context, '/add');
        },
        onHomeTap: () {
          Navigator.pushNamed(context, '/home');
        },
        onProfileTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilesPage(uid: widget.uid),
            ),
          );
        },
      ),
    );
  }
}
