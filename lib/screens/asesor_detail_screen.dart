import 'package:flutter/material.dart';
import '../models/tutor.dart';

class AsesorDetailScreen extends StatelessWidget {
  final Tutor tutor;
  final Color _primaryColor = const Color(0xFF4A6B3D); // Verde oscuro
  final Color _secondaryColor = const Color(0xFF8B5A2B); // Café
  final Color _accentColor = const Color(0xFFD2B48C); // Beige
  final Color _backgroundColor = const Color(0xFFF5F5F0); // Beige claro

  const AsesorDetailScreen({super.key, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tutor.nombre,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _primaryColor.withOpacity(0.1),
              _backgroundColor.withOpacity(0.3),
              _backgroundColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Sección superior con foto y datos básicos
              _buildProfileHeader(context),
              // Sección de información detallada
              _buildInfoSection(),
              // Sección de calificación
              _buildRatingSection(),
              // Sección de contacto y acciones
              _buildContactSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: _primaryColor.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _accentColor,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(tutor.imagen),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            tutor.nombre,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tutor.especialidad,
            style: TextStyle(
              fontSize: 16,
              color: _secondaryColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: _secondaryColor, size: 16),
              const SizedBox(width: 4),
              Text(
                "Disponible en línea",
                style: TextStyle(color: _secondaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre ${tutor.nombre.split(' ')[0]}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            tutor.descripcion,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildStatsRow(),
          const SizedBox(height: 24),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _accentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: _accentColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("12", "Clases"),
          _buildStatItem("35", "Horas"),
          _buildStatItem("24", "Estudiantes"),
          _buildStatItem("4.8", "Rating"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _primaryColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: _secondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Habilidades",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildSkillChip("Matemáticas Avanzadas"),
            _buildSkillChip("Física Universitaria"),
            _buildSkillChip("Métodos de Enseñanza"),
            _buildSkillChip("Paciencia"),
            _buildSkillChip("Claridad"),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(color: _primaryColor),
      ),
      backgroundColor: _accentColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: _accentColor),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
          border: Border.all(
            color: _accentColor.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Calificación",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _primaryColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "4.8",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _secondaryColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 0.8,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
              valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
              backgroundColor: _accentColor.withOpacity(0.3),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("5 estrellas (80%)"),
                Text("24 reseñas"),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "¿Cómo fue tu experiencia con ${tutor.nombre.split(' ')[0]}?",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: _secondaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < 4 ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 30,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Contacta a ${tutor.nombre.split(' ')[0]}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactButton(
                icon: Icons.email,
                color: _secondaryColor,
                onPressed: () {
                  _showContactDialog(context, "Email");
                },
              ),
              _buildContactButton(
                icon: Icons.phone,
                color: _primaryColor,
                onPressed: () {
                  _showContactDialog(context, "Teléfono");
                },
              ),
              _buildContactButton(
                icon: Icons.video_call,
                color: Colors.green,
                onPressed: () {
                  _showContactDialog(context, "Videollamada");
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () {
                _showConfirmationDialog(context);
              },
              child: const Text(
                'Reservar Sesión',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
  onTap: () {
    // Acción cuando se toca el ícono
    print("Ícono tocado");
  },
  child: Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blue, // o cualquier color que uses
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Icon(
      Icons.star, // el ícono que quieras mostrar
      color: Colors.white,
      size: 24,
    ),
  ),
);

  }

  void _showContactDialog(BuildContext context, String method) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Contactar por $method"),
        content: Text(
            "¿Deseas contactar a ${tutor.nombre} por $method?\n\n${method == "Email" ? "tutor.email@example.com" : method == "Teléfono" ? "+52 55 1234 5678" : "Iniciar videollamada"}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancelar",
              style: TextStyle(color: _secondaryColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Conectando con ${tutor.nombre} por $method..."),
                  backgroundColor: _primaryColor,
                ),
              );
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar Reservación"),
        content: const Text("¿Deseas reservar una sesión con este tutor?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancelar",
              style: TextStyle(color: _secondaryColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Sesión reservada con ${tutor.nombre}!"),
                  backgroundColor: _primaryColor,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}