// lib/screens/asesores_screen.dart
import 'package:flutter/material.dart';
import 'asesor_detail_screen.dart'; // Importa la pantalla de detalle del asesor

class AsesoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asesores Disponibles'),
      ),
      body: ListView(
        children: [
          // Asesor 1 - Juan Pérez
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/tutor1.png'), // Imagen local
            ),
            title: Text('Juan Pérez'),
            subtitle: Text('Matemáticas, Física'),
            onTap: () {
              // Navegar a la pantalla de detalle del asesor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AsesorDetailScreen(
                    nombre: 'Juan Pérez',
                    especialidad: 'Matemáticas, Física',
                    descripcion: 'Experto en álgebra y cálculo avanzado.',
                    imagen: 'assets/tutor1.png',
                  ),
                ),
              );
            },
          ),
          // Asesor 2 - María López
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/tutor2.png'), // Imagen local
            ),
            title: Text('María López'),
            subtitle: Text('Química, Biología'),
            onTap: () {
              // Navegar a la pantalla de detalle del asesor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AsesorDetailScreen(
                    nombre: 'María López',
                    especialidad: 'Química, Biología',
                    descripcion: 'Especialista en bioquímica y biología molecular.',
                    imagen: 'assets/tutor2.png',
                  ),
                ),
              );
            },
          ),
          // Asesor 3 - Carlos Gómez
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/tutor1.png'), // Imagen local
            ),
            title: Text('Carlos Gómez'),
            subtitle: Text('Física, Astronomía'),
            onTap: () {
              // Navegar a la pantalla de detalle del asesor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AsesorDetailScreen(
                    nombre: 'Carlos Gómez',
                    especialidad: 'Física, Astronomía',
                    descripcion: 'Físico teórico con enfoque en astrofísica.',
                    imagen: 'assets/tutor1.png',
                  ),
                ),
              );
            },
          ),
          // Más asesores...
        ],
      ),
    );
  }
}
