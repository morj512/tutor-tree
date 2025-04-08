import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String userType;
  const HomeScreen({super.key, required this.userType});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "";

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  // Cargar el correo guardado desde SharedPreferences
  _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');

    if (savedEmail != null) {
      setState(() {
        email = savedEmail;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenido ${widget.userType}")),
      body: Center(
        child: email.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Correo electrónico: $email'),
                  Text('Tipo de usuario: ${widget.userType}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear(); // Borrar los datos
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text("Cerrar sesión"),
                  ),
                ],
              ),
      ),
    );
  }
}
