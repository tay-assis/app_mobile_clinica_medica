import 'package:flutter/material.dart';

class DoctorAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double width;
  final double height;

  const DoctorAvatar({
    super.key,
    required this.imageUrl,
    required this.radius,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(AssetImage(imageUrl), context),
      builder: (context, snapshot) {
        Widget avatarContent;

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError == false) {
          // Imagem carregada com sucesso
          avatarContent = CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(imageUrl),
            backgroundColor: Colors.transparent,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // Ainda carregando
          avatarContent = const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey,
            child: CircularProgressIndicator(),
          );
        } else {
          // Erro ao carregar imagem
          avatarContent = const CircleAvatar(
            radius: 45,
            backgroundColor: Color.fromARGB(255, 219, 219, 219),
            child: Icon(Icons.person, size: 40, color: Colors.white),
          );
        }

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF0089FF), width: 2),
          ),
          child: avatarContent,
        );
      },
    );
  }
}
