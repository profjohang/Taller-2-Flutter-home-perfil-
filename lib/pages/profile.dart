import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;

  const ProfilePage({
    super.key,
    required this.user
  });

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue, 
      title: Text(
        user.nombre, // El texto
        style: TextStyle(color: Colors.white), // El estilo del texto
      ),      
      centerTitle: true,
      elevation: 2,
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60, // Tamaño del avatar más grande para el perfil
              backgroundImage: NetworkImage(user.imageUrl), // Muestra la imagen del usuario
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 20),
            Text(
              "Nombre: ${user.nombre}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Edad: ${user.edad}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Categoría: ${user.categoria}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}