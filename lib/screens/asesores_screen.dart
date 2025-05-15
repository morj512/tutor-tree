import 'package:flutter/material.dart';
import 'package:tutor_tree/models/tutor.dart';
import 'package:tutor_tree/screens/asesor_detail_screen.dart';

class AsesoresScreen extends StatefulWidget {
  @override
  _AsesoresScreenState createState() => _AsesoresScreenState();
}

class _AsesoresScreenState extends State<AsesoresScreen> {
  // Colores
  static const Color _verdePrincipal = Color(0xFF4CAF50);
  static const Color _verdeClaro = Color(0xFFC8E6C9);
  static const Color _cafe = Color(0xFF8D6E63);
  static const Color _beige = Color(0xFFD7CCC8);
  static const Color _blanco = Color(0xFFFFF8F0);
  static const Color _cafeOscuro = Color(0xFF5D4037);

  // Lista de tutores (aquí iría tu lista completa de tutores)
  final List<Tutor> todosLosTutores = [
    Tutor(
    nombre: 'Paula Montserrat',
    calificacion: 5.0,
    especialidad: 'Ecuaciones Diferenciales',
    descripcion: 'Doctora en Matemáticas con 10 años de experiencia en modelado de sistemas dinámicos.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Carlos Gómez',
    calificacion: 4.9,
    especialidad: 'Cálculo Multivariable',
    descripcion: 'Ingeniero civil con especialización en métodos matemáticos para ingeniería.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Andrea López',
    calificacion: 4.8,
    especialidad: 'Álgebra Lineal',
    descripcion: 'Experta en espacios vectoriales y aplicaciones a la computación gráfica.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'Luis García',
    calificacion: 4.8,
    especialidad: 'Física Mecánica',
    descripcion: 'Profesor universitario especializado en mecánica clásica y dinámica.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Ana Rodríguez',
    calificacion: 4.7,
    especialidad: 'Probabilidad',
    descripcion: 'Estadística con experiencia en modelos predictivos y teoría de probabilidades.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Juan Pérez',
    calificacion: 4.7,
    especialidad: 'Cálculo Integral',
    descripcion: 'Especialista en técnicas de integración y aplicaciones físicas.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Elena Martín',
    calificacion: 4.6,
    especialidad: 'Ecuaciones Diferenciales Parciales',
    descripcion: 'Investigadora en métodos numéricos para PDEs en fluidodinámica.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Felipe Martínez',
    calificacion: 4.6,
    especialidad: 'Estadística Inferencial',
    descripcion: 'Experto en diseño de experimentos y análisis de datos complejos.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Marta Sánchez',
    calificacion: 4.5,
    especialidad: 'Física Cuántica',
    descripcion: 'Doctora en Física Teórica con publicaciones en revistas indexadas.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'José Rodríguez',
    calificacion: 4.5,
    especialidad: 'Matemáticas Discretas',
    descripcion: 'Especialista en teoría de grafos aplicada a redes computacionales.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Ricardo López',
    calificacion: 4.4,
    especialidad: 'Cálculo Vectorial',
    descripcion: 'Profesor con enfoque en aplicaciones electromagnéticas.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Isabel Fernández',
    calificacion: 4.4,
    especialidad: 'Geometría Diferencial',
    descripcion: 'Experta en variedades diferenciables y sus aplicaciones.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'David Jiménez',
    calificacion: 4.3,
    especialidad: 'Álgebra Abstracta',
    descripcion: 'Especialista en teoría de grupos y estructuras algebraicas.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Lucía González',
    calificacion: 4.3,
    especialidad: 'Física Térmica',
    descripcion: 'Ingeniera química con amplia experiencia en termodinámica.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Javier López',
    calificacion: 4.2,
    especialidad: 'Probabilidad Avanzada',
    descripcion: 'Experto en procesos estocásticos y cadenas de Markov.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Patricia Ramírez',
    calificacion: 4.2,
    especialidad: 'Análisis Numérico',
    descripcion: 'Especialista en métodos computacionales para ecuaciones diferenciales.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'Ramón Álvarez',
    calificacion: 4.1,
    especialidad: 'Teoría de Números',
    descripcion: 'Investigador en teoría algebraica de números y criptografía.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Nadia Ninel',
    calificacion: 4.1,
    especialidad: 'Análisis Complejo',
    descripcion: 'Doctora en Matemáticas con énfasis en variable compleja.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Pedro Gómez',
    calificacion: 4.0,
    especialidad: 'Mecánica Estadística',
    descripcion: 'Físico teórico especializado en sistemas de muchas partículas.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Isabella Morales',
    calificacion: 4.0,
    especialidad: 'Topología',
    descripcion: 'Experta en espacios topológicos y geometría no euclidiana.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'David García',
    calificacion: 3.9,
    especialidad: 'Ecuaciones Integrales',
    descripcion: 'Especialista en teoría y aplicaciones de ecuaciones integrales.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'José Manuel Ortega',
    calificacion: 3.9,
    especialidad: 'Física de Partículas',
    descripcion: 'Investigador en modelos teóricos de física de altas energías.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Dulce Mauricio',
    calificacion: 3.8,
    especialidad: 'Geometría Algebraica',
    descripcion: 'Doctora en Matemáticas con enfoque en variedades algebraicas.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Miguel Ángel López',
    calificacion: 3.8,
    especialidad: 'Estadística Bayesiana',
    descripcion: 'Experto en inferencia bayesiana y modelos jerárquicos.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Antonio Pérez',
    calificacion: 3.7,
    especialidad: 'Teoría de la Medida',
    descripcion: 'Especialista en fundamentos del análisis real avanzado.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Lucía Gómez',
    calificacion: 3.7,
    especialidad: 'Física de Materiales',
    descripcion: 'Ingeniera de materiales con enfoque en propiedades cuánticas.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Ricardo Fernández',
    calificacion: 3.6,
    especialidad: 'Teoría de Categorías',
    descripcion: 'Matemático especializado en estructuras algebraicas abstractas.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Beatriz López',
    calificacion: 3.6,
    especialidad: 'Mecánica Cuántica Avanzada',
    descripcion: 'Investigadora en fundamentos de la teoría cuántica.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'Héctor González',
    calificacion: 3.5,
    especialidad: 'Análisis Funcional',
    descripcion: 'Especialista en espacios de Banach y operadores lineales.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Sofía Martínez',
    calificacion: 3.5,
    especialidad: 'Relatividad General',
    descripcion: 'Física teórica con investigación en cosmología moderna.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Alberto Ruiz',
    calificacion: 3.4,
    especialidad: 'Teoría de Grafos',
    descripcion: 'Experto en algoritmos gráficos y aplicaciones computacionales.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Eva Navarro',
    calificacion: 3.4,
    especialidad: 'Probabilidad Discreta',
    descripcion: 'Especialista en modelos probabilísticos discretos.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Fernando Castro',
    calificacion: 3.3,
    especialidad: 'Teoría de Control',
    descripcion: 'Ingeniero experto en sistemas dinámicos y control óptimo.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Natalia Jiménez',
    calificacion: 3.3,
    especialidad: 'Geometría Fractal',
    descripcion: 'Investigadora en sistemas dinámicos y geometría compleja.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'Oscar Mendoza',
    calificacion: 3.2,
    especialidad: 'Análisis Armónico',
    descripcion: 'Especialista en series de Fourier y análisis espectral.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Paula Vega',
    calificacion: 3.2,
    especialidad: 'Física Estadística',
    descripcion: 'Experta en transiciones de fase y fenómenos críticos.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Raúl Herrera',
    calificacion: 3.1,
    especialidad: 'Teoría de Juegos',
    descripcion: 'Matemático aplicado con enfoque en estrategias óptimas.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Silvia Peña',
    calificacion: 3.1,
    especialidad: 'Topología Algebraica',
    descripcion: 'Especialista en homotopía y grupos fundamentales.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Tomás Ríos',
    calificacion: 3.0,
    especialidad: 'Mecánica Analítica',
    descripcion: 'Profesor de física con enfoque en formulaciones lagrangianas.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Verónica Soto',
    calificacion: 3.0,
    especialidad: 'Teoría de Nudos',
    descripcion: 'Investigadora en clasificación de nudos matemáticos.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'Arturo Miranda',
    calificacion: 2.9,
    especialidad: 'Ecuaciones Estocásticas',
    descripcion: 'Experto en ecuaciones diferenciales con ruido aleatorio.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Bianca Cortés',
    calificacion: 2.9,
    especialidad: 'Física Matemática',
    descripcion: 'Especialista en métodos matemáticos para física teórica.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Daniel Rojas',
    calificacion: 2.8,
    especialidad: 'Teoría de Representación',
    descripcion: 'Matemático especializado en grupos de Lie y álgebras.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Gabriela Paredes',
    calificacion: 2.8,
    especialidad: 'Dinámica de Fluidos',
    descripcion: 'Ingeniera especializada en modelado de flujos complejos.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Iván Cordero',
    calificacion: 2.7,
    especialidad: 'Lógica Matemática',
    descripcion: 'Experto en fundamentos lógicos de las matemáticas.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Jimena León',
    calificacion: 2.7,
    especialidad: 'Teoría de Operadores',
    descripcion: 'Especialista en álgebras de operadores lineales.',
    imagen: 'assets/images/tutor6.png',
  ),
  Tutor(
    nombre: 'Kevin Salazar',
    calificacion: 2.6,
    especialidad: 'Geometría Simpléctica',
    descripcion: 'Investigador en estructuras geométricas para mecánica.',
    imagen: 'assets/images/tutor1.png',
  ),
  Tutor(
    nombre: 'Laura Méndez',
    calificacion: 2.6,
    especialidad: 'Teoría Ergódica',
    descripcion: 'Especialista en sistemas dinámicos y teoría de la medida.',
    imagen: 'assets/images/tutor2.png',
  ),
  Tutor(
    nombre: 'Mario Quiroz',
    calificacion: 2.5,
    especialidad: 'Análisis No Estándar',
    descripcion: 'Experto en fundamentos alternativos del cálculo infinitesimal.',
    imagen: 'assets/images/tutor3.png',
  ),
  Tutor(
    nombre: 'Nadia Blanco',
    calificacion: 2.5,
    especialidad: 'Física de Plasmas',
    descripcion: 'Investigadora en dinámica de fluidos ionizados.',
    imagen: 'assets/images/tutor4.png',
  ),
  Tutor(
    nombre: 'Pablo Guzmán',
    calificacion: 2.4,
    especialidad: 'Teoría de Galois',
    descripcion: 'Especialista en teoría de cuerpos y ecuaciones algebraicas.',
    imagen: 'assets/images/tutor5.png',
  ),
  Tutor(
    nombre: 'Rebeca Luna',
    calificacion: 2.4,
    especialidad: 'Topología Diferencial',
    descripcion: 'Experta en variedades diferenciables y aplicaciones.',
    imagen: 'assets/images/tutor6.png',
  ),
  ];

  // Categorías principales
  final List<String> categorias = [
    'Todos',
    'Cálculo',
    'Ecuaciones Diferenciales',
    'Álgebra',
    'Física',
    'Estadística',
    'Probabilidad',
    'Matemáticas Discretas',
  ];

  // Mapeo de categorías con sus subcategorías
  final Map<String, List<String>> categoriasConSubcategorias = {
    'Cálculo': [
      'Cálculo',
      'Cálculo Integral',
      'Cálculo Diferencial',
      'Cálculo Multivariable',
      'Cálculo Vectorial',
      'Análisis Matemático'
    ],
    'Ecuaciones Diferenciales': [
      'Ecuaciones Diferenciales',
      'Ecuaciones Diferenciales Parciales',
      'Ecuaciones Integrales',
      'Ecuaciones Estocásticas'
    ],
    'Álgebra': [
      'Álgebra',
      'Álgebra Lineal',
      'Álgebra Abstracta',
      'Teoría de Grupos',
      'Geometría Algebraica'
    ],
    'Física': [
      'Física',
      'Física Mecánica',
      'Física Cuántica',
      'Física Teórica',
      'Física Estadística',
      'Mecánica Analítica',
      'Relatividad General',
      'Física de Partículas'
    ],
    'Estadística': [
      'Estadística',
      'Estadística Inferencial',
      'Estadística Bayesiana'
    ],
    'Probabilidad': [
      'Probabilidad',
      'Probabilidad Avanzada',
      'Probabilidad Discreta',
      'Teoría de la Medida'
    ],
    'Matemáticas Discretas': [
      'Matemáticas Discretas',
      'Teoría de Grafos',
      'Teoría de Números',
      'Teoría de Juegos',
      'Lógica Matemática'
    ],
  };

  // Colores para cada categoría
  final Map<String, Color> categoriaColores = {
    'Cálculo': Color(0xFF8D6E63), // Café
    'Álgebra': Color(0xFF689F38), // Verde oscuro
    'Ecuaciones Diferenciales': Color(0xFF4CAF50), // Verde principal
    'Física': Color(0xFFF57C00), // Naranja
    'Matemáticas Discretas': Color(0xFF7E57C2), // Morado
    'Estadística': Color(0xFF5D4037), // Café oscuro
    'Probabilidad': Color(0xFF0288D1), // Azul
  };

  String filtroSeleccionado = 'Todos';
  String busqueda = '';

  List<Tutor> get tutoresFiltrados {
    List<Tutor> filtrados = todosLosTutores;
    
    if (filtroSeleccionado != 'Todos') {
      final subcategorias = categoriasConSubcategorias[filtroSeleccionado] ?? [];
      filtrados = filtrados.where((tutor) {
        // Verifica si la especialidad coincide con alguna subcategoría
        return subcategorias.any((subcat) => tutor.especialidad.contains(subcat));
      }).toList();
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
      backgroundColor: _blanco,
      appBar: AppBar(
        title: Text('Asesores Disponibles', 
          style: TextStyle(color: _cafeOscuro)),
        elevation: 0,
        backgroundColor: _verdeClaro,
        iconTheme: IconThemeData(color: _cafeOscuro),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: _beige,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar asesores...',
                  prefixIcon: Icon(Icons.search, color: _cafe),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                onChanged: (value) => setState(() => busqueda = value),
              ),
            ),
          ),

          // Filtros de categorías
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final isSelected = filtroSeleccionado == categoria;
                
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(categoria,
                      style: TextStyle(
                        color: isSelected ? Colors.white : _cafeOscuro,
                      )),
                    selected: isSelected,
                    selectedColor: categoriaColores[categoria] ?? _verdePrincipal,
                    backgroundColor: _beige,
                    onSelected: (selected) {
                      setState(() {
                        filtroSeleccionado = selected ? categoria : 'Todos';
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),

          // Contador de resultados
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${tutoresFiltrados.length} asesores encontrados',
                style: TextStyle(
                  color: _cafeOscuro.withOpacity(0.7),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),

// Lista de tutores
Expanded(
  child: ListView.builder(
    padding: EdgeInsets.only(bottom: 16),
    itemCount: tutoresFiltrados.length,
    itemBuilder: (context, index) {
      final tutor = tutoresFiltrados[index];
      final categoriaColor = categoriaColores.entries
          .firstWhere(
            (e) => categoriasConSubcategorias[e.key]?.any(
                  (subcat) => tutor.especialidad.contains(subcat)) ?? false,
            orElse: () => MapEntry('', _verdePrincipal)).value;
      
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: _cafe.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _beige,
            radius: 30,
            child: ClipOval(
              child: Image.asset(
                tutor.imagen,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
            ),
          ),
          title: Text(
            tutor.nombre,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _cafeOscuro,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tutor.especialidad,
                style: TextStyle(
                  color: categoriaColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(
                    tutor.calificacion.toStringAsFixed(1),
                    style: TextStyle(
                      color: _cafeOscuro,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: _cafe,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AsesorDetailScreen(tutor: tutor),
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