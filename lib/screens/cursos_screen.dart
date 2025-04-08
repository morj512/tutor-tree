import 'package:flutter/material.dart';

class CursosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Cursos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Curso de Matemáticas Avanzadas'),
            subtitle: Text('Nivel: Intermedio'),
            onTap: () {
              // Aquí puedes agregar la lógica para editar el curso o ver detalles
              print('Ver detalles del curso');
            },
          ),
          ListTile(
            title: Text('Curso de Física Cuántica'),
            subtitle: Text('Nivel: Avanzado'),
            onTap: () {
              // Lógica para ver detalles del curso
              print('Ver detalles del curso');
            },
          ),
          // Más cursos...
        ],
      ),
    );
  }
}
