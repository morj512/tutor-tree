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
          color: Colors.blueAccent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatbotScreen()), // Sin 'const'
            );
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.chalkboardTeacher,
          title: 'Asesores Disponibles',
          color: Colors.greenAccent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AsesoresScreen()), // Sin 'const'
            );
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.book,
          title: 'Mis Cursos',
          color: Colors.orangeAccent,
          onTap: () {
            // Navegar a cursos del estudiante
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.calendarAlt,
          title: 'Agendar Tutoría',
          color: Colors.purpleAccent,
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
          color: Colors.tealAccent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CursosScreen()), // Sin 'const'
            );
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.comments,
          title: 'Mensajes',
          color: Colors.pinkAccent,
          onTap: () {
            // Navegar a mensajes
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.calendarCheck,
          title: 'Horarios',
          color: Colors.amberAccent,
          onTap: () {
            // Navegar a horarios
          },
        ),
        _buildFeatureCard(
          icon: FontAwesomeIcons.chartLine,
          title: 'Estadísticas',
          color: Colors.deepPurpleAccent,
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
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
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
                    color: Colors.grey[800],
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
        color: Colors.indigo.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Hola de nuevo!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                widget.userType == 'Estudiante' ? 'Estudiante' : 'Tutor',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
      appBar: AppBar(
        title: const Text('Tutor Tree'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.indigo,
        centerTitle: true,
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
        items: const [
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
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
