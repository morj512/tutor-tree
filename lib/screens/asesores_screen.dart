import 'package:flutter/material.dart';
import 'package:tutor_tree/models/tutor.dart';
import 'package:tutor_tree/screens/asesor_detail_screen.dart'; // Asegúrate de importar tu pantalla

class AsesoresScreen extends StatefulWidget {
  @override
  _AsesoresScreenState createState() => _AsesoresScreenState();
}

class _AsesoresScreenState extends State<AsesoresScreen> {
  // Lista de tutores con sus materias y calificaciones
  final List<Tutor> todosLosTutores = [
    // Tutores con calificación más alta
    Tutor(
    nombre: 'María Pérez',
    calificacion: 5.0,
    especialidad: 'Ecuaciones Diferenciales',
    descripcion: 'Profesora con maestría en modelado matemático.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Carlos Gómez',
    calificacion: 4.8,
    especialidad: 'Cálculo',
    descripcion: 'Especialista en cálculo diferencial e integral.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Andrea López',
    calificacion: 4.7,
    especialidad: 'Álgebra',
    descripcion: 'Amplia experiencia enseñando álgebra lineal y matrices.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Luis García',
    calificacion: 4.6,
    especialidad: 'Física',
    descripcion: 'Ideal para estudiantes de ingeniería básica.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Ana Rodríguez',
    calificacion: 4.5,
    especialidad: 'Matemáticas Avanzadas',
    descripcion: 'Experta en álgebra abstracta y geometría algebraica.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Juan Pérez',
    calificacion: 4.4,
    especialidad: 'Cálculo Numérico',
    descripcion: 'Apoyo en métodos numéricos y soluciones computacionales.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Elena Martín',
    calificacion: 4.3,
    especialidad: 'Ecuaciones Diferenciales',
    descripcion: 'Enseñanza en ecuaciones diferenciales de primer y segundo orden.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Felipe Martínez',
    calificacion: 4.2,
    especialidad: 'Cálculo Integral',
    descripcion: 'Enseña técnicas avanzadas en integración.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Marta Sánchez',
    calificacion: 4.1,
    especialidad: 'Física Teórica',
    descripcion: 'Especialista en física cuántica y mecánica clásica.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'José Rodríguez',
    calificacion: 4.0,
    especialidad: 'Estadística',
    descripcion: 'Especialista en probabilidad y estadística.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Ricardo López',
    calificacion: 3.9,
    especialidad: 'Matemáticas Discretas',
    descripcion: 'Apoyo en lógica matemática y teoría de grafos.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Isabel Fernández',
    calificacion: 3.8,
    especialidad: 'Geometría Analítica',
    descripcion: 'Especialista en geometría euclidiana y analítica.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'David Jiménez',
    calificacion: 3.7,
    especialidad: 'Álgebra Lineal',
    descripcion: 'Expertos en álgebra de matrices y espacios vectoriales.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Lucía González',
    calificacion: 3.6,
    especialidad: 'Física Experimental',
    descripcion: 'Guía en experimentos prácticos de física.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Javier López',
    calificacion: 3.5,
    especialidad: 'Cálculo Multivariable',
    descripcion: 'Especialista en cálculo en más de una variable.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Patricia Ramírez',
    calificacion: 3.4,
    especialidad: 'Química',
    descripcion: 'Experta en química orgánica e inorgánica.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Ramón Álvarez',
    calificacion: 3.3,
    especialidad: 'Programación en C',
    descripcion: 'Instructor con experiencia en programación de bajo nivel.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Teresa Ruiz',
    calificacion: 3.2,
    especialidad: 'Análisis Matemático',
    descripcion: 'Guía en técnicas de análisis real y complejo.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Pedro Gómez',
    calificacion: 3.1,
    especialidad: 'Ecuaciones en Derivadas Parciales',
    descripcion: 'Especialista en PDEs y sus aplicaciones.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Carla Díaz',
    calificacion: 3.0,
    especialidad: 'Modelado Matemático',
    descripcion: 'Ayuda en la formulación matemática de problemas reales.',
    imagen: 'assets/images/tutor2.png',
  ),
  // Tutores adicionales...
  Tutor(
    nombre: 'David García',
    calificacion: 2.9,
    especialidad: 'Álgebra Lineal',
    descripcion: 'Apoyo en álgebra abstracta y matrices.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'José Manuel Ortega',
    calificacion: 2.8,
    especialidad: 'Física Cuántica',
    descripcion: 'Especialista en teorías cuánticas y relatividad.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Lina Martín',
    calificacion: 2.7,
    especialidad: 'Geometría Computacional',
    descripcion: 'Enseña geometría aplicada a la informática.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Miguel Ángel López',
    calificacion: 2.6,
    especialidad: 'Física Nuclear',
    descripcion: 'Experto en física nuclear aplicada.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Antonio Pérez',
    calificacion: 2.5,
    especialidad: 'Cálculo Diferencial',
    descripcion: 'Enseña cálculo diferencial en el contexto de ingeniería.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Lucía Gómez',
    calificacion: 2.4,
    especialidad: 'Computación',
    descripcion: 'Apoyo en temas relacionados con programación en Python.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Ricardo Fernández',
    calificacion: 2.3,
    especialidad: 'Teoría de Números',
    descripcion: 'Guía en la teoría de números y sus aplicaciones.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Beatriz López',
    calificacion: 2.2,
    especialidad: 'Mecánica Cuántica',
    descripcion: 'Enseña los principios de la mecánica cuántica.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Héctor González',
    calificacion: 2.1,
    especialidad: 'Cálculo en Varias Variables',
    descripcion: 'Guía en cálculo multivariable aplicado a física.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Sofia Martínez',
    calificacion: 2.0,
    especialidad: 'Física Relativista',
    descripcion: 'Especialista en teorías relativistas y aplicaciones.',
    imagen: 'assets/images/tutor2.png',
  ),
  ];

  // Filtros de categorías de materias
  final List<String> categorias = [
    'Todos',
    'Cálculo',
    'Ecuaciones Diferenciales',
    'Álgebra',
    'Física',
    'Estadística',
    'Programación',
    'Química',
  ];

final Map<String, Color> categoriaColores = {
  'Cálculo': Colors.redAccent,
  'Álgebra': Colors.deepPurpleAccent,
  'Ecuaciones Diferenciales': Colors.green,
  'Física': Colors.orangeAccent,
  'Química': Colors.teal,
  'Estadística': Colors.blueAccent,
  'Programación': Colors.indigo,
  'Otro': Colors.grey,
};


  String filtroSeleccionado = 'Todos';

  List<Tutor> get tutoresFiltrados {
    if (filtroSeleccionado == 'Todos') {
      return todosLosTutores;
    } else {
      return todosLosTutores
          .where((tutor) => tutor.especialidad == filtroSeleccionado)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asesores Disponibles')),
      body: Column(
        children: [
          // Filtro como barra horizontal debajo del AppBar
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      filtroSeleccionado = categoria;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: filtroSeleccionado == categoria
                      ? categoriaColores[categoria] ?? Colors.blueAccent
                      : Colors.grey[300],

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categoria,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: filtroSeleccionado == categoria
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Lista de tutores
          Expanded(
            child: ListView.builder(
              itemCount: tutoresFiltrados.length,
              itemBuilder: (context, index) {
                final tutor = tutoresFiltrados[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(tutor.imagen),
                    ),
                    title: Text(tutor.nombre),
                    subtitle: Text(tutor.especialidad),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (i) {
                        return Icon(
                          i < tutor.calificacion.round()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow,
                        );
                      }),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AsesorDetailScreen(tutor: tutor),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}