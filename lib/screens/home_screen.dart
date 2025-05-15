import 'package:flutter/material.dart';
import 'package:tutor_tree/screens/asesores_screen.dart';
import 'package:tutor_tree/screens/cursos_screen.dart';
import 'package:tutor_tree/screens/chatbot_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  final String userType;
  
  const HomeScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // Paleta de colores
  final Color _primaryGreen = const Color(0xFF8BA888);
  final Color _lightBeige = const Color(0xFFF5F1E6);
  final Color _darkBrown = const Color(0xFF5E4B3D);
  final Color _softBlue = const Color(0xFFA7BED3);
  final Color _warmBeige = const Color(0xFFD8CCA3);
  
  late AnimationController _animationController;
  final AudioPlayer _player = AudioPlayer();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _playWelcomeSound();
  }

  Future<void> _playWelcomeSound() async {
    try {
      await _player.play(AssetSource('sounds/bienvenido.mp3'));
    } catch (e) {
      debugPrint('Error al reproducir sonido: $e');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _player.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _animationController.reset();
    _animationController.forward();
  }

  Widget _buildStudentDashboard() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      padding: const EdgeInsets.all(16),
      children: [
        _buildFeatureCard(
          icon: FontAwesomeIcons.robot,
          title: 'Chatbot Inteligente',
          color: _softBlue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatbotScreen()),
            );
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.chalkboardTeacher,
          title: 'Asesores Disponibles',
          color: _primaryGreen,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AsesoresScreen()),
            );
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.book,
          title: 'Mis Cursos',
          color: _warmBeige,
          textColor: _darkBrown,
          onTap: () {
            // Navegar a cursos del estudiante
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.calendarAlt,
          title: 'Agendar Tutoría',
          color: Color(0xFFD4A59A), // Un tono café rosado suave
          onTap: () {
            // Navegar a agenda
          },
        ),
      ],
    );
  }

  Widget _buildTutorDashboard() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      padding: const EdgeInsets.all(16),
      children: [
        _buildFeatureCard(
          icon: FontAwesomeIcons.bookOpen,
          title: 'Mis Cursos',
          color: _primaryGreen,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CursosScreen()),
            );
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.comments,
          title: 'Mensajes',
          color: _softBlue,
          onTap: () {
            // Navegar a mensajes
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.calendarCheck,
          title: 'Horarios',
          color: _warmBeige,
          textColor: _darkBrown,
          onTap: () {
            // Navegar a horarios
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.chartLine,
          title: 'Estadísticas',
          color: Color(0xFFC6AC8F), // Un tono café claro
          onTap: () {
            // Navegar a estadísticas
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    Color textColor = Colors.black54,
    required VoidCallback onTap,
  }) {
    return ScaleTransition(
      scale: Tween(begin: 0.95, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: _lightBeige,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _animationController.forward(from: 0);
            onTap();
          },
          splashColor: color.withOpacity(0.2),
          highlightColor: color.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _buildUserGreeting() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _primaryGreen.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _primaryGreen.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: _primaryGreen,
            child: Icon(Icons.person, color: _lightBeige),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Hola de nuevo!',
                style: TextStyle(
                  fontSize: 14,
                  color: _darkBrown.withOpacity(0.7),
                ),
              ),
              Text(
                widget.userType == 'Estudiante' ? 'Estudiante' : 'Tutor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _darkBrown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lightBeige,
      appBar: AppBar(
        title: Text(
          'Tutor Tree',
          style: TextStyle(
            color: _darkBrown,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: _darkBrown),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserGreeting(),
            widget.userType == 'Estudiante' 
                ? _buildStudentDashboard() 
                : _buildTutorDashboard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _lightBeige,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _primaryGreen,
        unselectedItemColor: _darkBrown.withOpacity(0.6),
        onTap: _onItemTapped,
      ),
    );
  }
}