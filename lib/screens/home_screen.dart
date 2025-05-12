import 'package:flutter/material.dart';
import 'package:tutor_tree/screens/asesores_screen.dart'; // Asegúrate de que esta importación esté presente
import 'package:tutor_tree/screens/cursos_screen.dart'; // Asegúrate de que esta importación esté presente
import 'package:tutor_tree/screens/chatbot_screen.dart'; // Asegúrate de que esta importación esté presente

class HomeScreen extends StatelessWidget {
  final String userType;

  const HomeScreen({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Tutor Tree'),
      ),
      body: Column(
        children: [
          if (userType == 'Estudiante') ...[
            // Solo mostramos el botón si el usuario es estudiante
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
          ],
          // El contenido para los estudiantes
          if (userType == 'Estudiante') ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AsesoresScreen()), // Eliminar const aquí
                  );
                },
                child: const Text('Ver Asesores Disponibles'),
              ),
            ),
          ],
          // El contenido para los tutores
          if (userType == 'Tutor') ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CursosScreen()), // Eliminar const aquí
                  );
                },
                child: const Text('Mis Cursos'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para ver mensajes o notificaciones
                  // Puedes implementar la pantalla de mensajes aquí
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
