import 'package:flutter/material.dart';
import 'package:tutor_tree/screens/asesores_screen.dart';
import 'package:tutor_tree/screens/cursos_screen.dart';
import 'package:tutor_tree/screens/chatbot_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  final String userType;

  const HomeScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playWelcomeSound();
  }

  Future<void> _playWelcomeSound() async {
    try {
      await _player.play(AssetSource('sounds/bienvenido.mp3'));
    } catch (e) {
      print('Error al reproducir sonido: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Tutor Tree'),
      ),
      body: Column(
        children: [
          if (widget.userType == 'Estudiante') ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatbotScreen()),
                  );
                },
                child: const Text('Ver Chatbot'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AsesoresScreen()),
                  );
                },
                child: const Text('Ver Asesores Disponibles'),
              ),
            ),
          ],
          if (widget.userType == 'Tutor') ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CursosScreen()),
                  );
                },
                child: const Text('Mis Cursos'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica de mensajes
                },
                child: const Text('Mis Mensajes'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
