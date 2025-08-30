import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<UserModel> _users = [
    UserModel(
      nombre: "Carlos",
      edad: 15,
      categoria: "Menor de edad",
      imageUrl: "https://randomuser.me/api/portraits/men/10.jpg" 
    ),
    UserModel(
      nombre: "Johan M",
      edad: 27,
      categoria: "Mayor de edad",
      imageUrl: "https://randomuser.me/api/portraits/men/3.jpg" 
    ),
    UserModel(
      nombre: "María",
      edad: 35,
      categoria: "Mayor de edad",
      imageUrl: "https://randomuser.me/api/portraits/women/1.jpg" 
    ),
    UserModel(
      nombre: "Pedro",
      edad: 8,
      categoria: "Menor de edad",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg" 
    ),
  ];

  Widget _buildUserCard(BuildContext context, UserModel user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40, // Tamaño del avatar
            backgroundImage: NetworkImage(user.imageUrl), // Carga la imagen desde la URL
            backgroundColor: Colors.grey[200], // Color de fondo si la imagen no carga
          ),
          const SizedBox(height: 10),
          Text(
            user.nombre,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(user: user),
                ),
              );
            },
            child: const Text('Ver Perfil'),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = _users[index];
        return _buildUserCard(context, user);
      },
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue, 
      centerTitle: true, 
      elevation: 2, 
      title: const Text(
        "Taller Flutter 2",
        style: TextStyle(color: Colors.white),
      ),
    ),
    body: _users.isEmpty
        ? const Center(
            child: Text(
              "No hay usuarios registrados",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : _buildUserList(),
  );
}
}