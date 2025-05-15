import 'package:flutter/material.dart';
import 'package:tutor_tree/models/tutor.dart';
import 'package:tutor_tree/screens/asesor_detail_screen.dart';

class AsesoresScreen extends StatefulWidget {
  @override
  _AsesoresScreenState createState() => _AsesoresScreenState();
}

class _AsesoresScreenState extends State<AsesoresScreen> {
  final List<Tutor> todosLosTutores = [
    // ... (tu lista actual de tutores)
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
  };

  String filtroSeleccionado = 'Todos';
  String busqueda = '';

  List<Tutor> get tutoresFiltrados {
    List<Tutor> filtrados = todosLosTutores;
    
    if (filtroSeleccionado != 'Todos') {
      filtrados = filtrados.where((tutor) => tutor.especialidad == filtroSeleccionado).toList();
    }
    
    if (busqueda.isNotEmpty) {
      filtrados = filtrados.where((tutor) =>
          tutor.nombre.toLowerCase().contains(busqueda.toLowerCase()) ||
          tutor.especialidad.toLowerCase().contains(busqueda.toLowerCase()) ||
          tutor.descripcion.toLowerCase().contains(busqueda.toLowerCase())).toList();
    }
    
    return filtrados;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asesores Disponibles'),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.lightBlue.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar asesores...',
                prefixIcon: Icon(Icons.search, color: Colors.blue.shade700),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
              onChanged: (value) {
                setState(() {
                  busqueda = value;
                });
              },
            ),
          ),

          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final isSelected = filtroSeleccionado == categoria;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      filtroSeleccionado = categoria;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? categoriaColores[categoria] ?? Colors.blueAccent
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: (categoriaColores[categoria] ?? Colors.blueAccent).withOpacity(0.4),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        categoria,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  '${tutoresFiltrados.length} asesores encontrados',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 16),
              itemCount: tutoresFiltrados.length,
              itemBuilder: (context, index) {
                final tutor = tutoresFiltrados[index];
                final categoriaColor = categoriaColores.entries.firstWhere(
                  (entry) => tutor.especialidad.contains(entry.key),
                  orElse: () => MapEntry('Otro', Colors.grey)).value;
                
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AsesorDetailScreen(tutor: tutor),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: categoriaColor,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(tutor.imagen),
                          ),
                        ),
                        
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tutor.nombre,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  tutor.especialidad,
                                  style: TextStyle(
                                    color: categoriaColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.star, 
                                      color: Colors.amber, 
                                      size: 18),
                                    SizedBox(width: 4),
                                    Text(
                                      tutor.calificacion.toStringAsFixed(1),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: categoriaColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Ver perfil',
                                        style: TextStyle(
                                          color: categoriaColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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