// lib/screens/asesor_detail_screen.dart
import 'package:flutter/material.dart';

class AsesorDetailScreen extends StatelessWidget {
  final String nombre;
  final String especialidad;
  final String descripcion;
  final String imagen;

  AsesorDetailScreen({
    required this.nombre,
    required this.especialidad,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Asesor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del asesor
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imagen),
              ),
            ),
            SizedBox(height: 16),
            // Nombre del asesor
            Text(
              nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Especialidad
            Text(
              especialidad,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            // Descripción
            Text(
              'Descripción:\n$descripcion',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Botón de acción (puede ser para iniciar chat, agendar cita, etc.)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para iniciar el chat, agendar cita, etc.
                  print('Iniciar chat con $nombre');
                },
                child: Text('Iniciar Chat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
