// lib/screens/asesores_screen.dart
import 'package:flutter/material.dart';
import 'asesor_detail_screen.dart';

class Tutor {
  final String nombre;
  final String especialidad;
  final String descripcion;
  final String imagen;

  Tutor({
    required this.nombre,
    required this.especialidad,
    required this.descripcion,
    required this.imagen,
  });
}

class AsesoresScreen extends StatelessWidget {
  final List<Tutor> tutores = [
    Tutor(
      nombre: 'Carlos Pérez',
      especialidad: 'Matemáticas Avanzadas',
      descripcion: 'Experto en cálculo y álgebra lineal con 10 años de experiencia.',
      imagen: 'assets/images/tutor1.png',
    ),
    Tutor(
      nombre: 'María López',
      especialidad: 'Física para Ingeniería',
      descripcion: 'Apasionada por la enseñanza y la ciencia aplicada.',
      imagen: 'assets/images/tutor2.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asesores Disponibles')),
      body: ListView.builder(
        itemCount: tutores.length,
        itemBuilder: (context, index) {
          final tutor = tutores[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(tutor.imagen),
            ),
            title: Text(tutor.nombre),
            subtitle: Text(tutor.especialidad),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AsesorDetailScreen(tutor: tutor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
