import 'package:flutter/material.dart';
import '../models/tutor.dart';

class AsesorDetailScreen extends StatelessWidget {
  final Tutor tutor;
  final bool darkMode;
  final bool largeFont;
  
  // Colores para modo claro
  final Color _primaryColorLight = const Color(0xFF4A6B3D);
  final Color _secondaryColorLight = const Color(0xFF8B5A2B);
  final Color _accentColorLight = const Color(0xFFD2B48C);
  final Color _backgroundColorLight = const Color(0xFFF5F5F0);
  
  // Colores para modo oscuro
  final Color _primaryColorDark = const Color(0xFF8BA888);
  final Color _secondaryColorDark = const Color(0xFFD7CCC8);
  final Color _accentColorDark = const Color(0xFF5D4037);
  final Color _backgroundColorDark = const Color(0xFF121212);

  const AsesorDetailScreen({
    super.key, 
    required this.tutor,
    required this.darkMode,
    required this.largeFont,
  });

  // Getters para colores dinámicos
  Color get primaryColor => darkMode ? _primaryColorDark : _primaryColorLight;
  Color get secondaryColor => darkMode ? _secondaryColorDark : _secondaryColorLight;
  Color get accentColor => darkMode ? _accentColorDark : _accentColorLight;
  Color get backgroundColor => darkMode ? _backgroundColorDark : _backgroundColorLight;
  Color get textColor => darkMode ? Colors.white : Colors.black87;
  Color get cardColor => darkMode ? const Color(0xFF1E1E1E) : Colors.white;

  // Estilos de texto dinámicos
  TextStyle getTextStyle(bool isTitle, [bool isButton = false]) {
    return TextStyle(
      fontSize: largeFont 
          ? (isTitle ? 22.0 : 18.0) 
          : (isTitle ? 18.0 : 14.0),
      fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      color: textColor,
      height: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tutor.nombre,
          style: getTextStyle(true).copyWith(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_accessibility, size: largeFont ? 28 : 24),
            onPressed: () => _showAccessibilityOptions(context),
            tooltip: 'Opciones de accesibilidad',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.1),
              backgroundColor.withOpacity(0.3),
              backgroundColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(context),
              _buildInfoSection(),
              _buildRatingSection(),
              _buildContactSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(largeFont ? 24 : 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 2),
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
                    color: accentColor,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: largeFont ? 70 : 60,
                  backgroundImage: AssetImage(tutor.imagen),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: largeFont ? 24 : 20,
                ),
              ),
            ],
          ),
          SizedBox(height: largeFont ? 20 : 16),
          Text(
            tutor.nombre,
            style: getTextStyle(true).copyWith(color: primaryColor),
          ),
          SizedBox(height: largeFont ? 8 : 4),
          Text(
            tutor.especialidad,
            style: getTextStyle(false).copyWith(
              color: secondaryColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: largeFont ? 12 : 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: secondaryColor, size: largeFont ? 20 : 16),
              SizedBox(width: largeFont ? 8 : 4),
              Text(
                "Disponible en línea",
                style: getTextStyle(false).copyWith(color: secondaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: EdgeInsets.all(largeFont ? 24 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre ${tutor.nombre.split(' ')[0]}",
            style: getTextStyle(true).copyWith(color: primaryColor),
          ),
          SizedBox(height: largeFont ? 16 : 12),
          Text(
            tutor.descripcion,
            style: getTextStyle(false),
          ),
          SizedBox(height: largeFont ? 28 : 24),
          _buildStatsRow(),
          SizedBox(height: largeFont ? 28 : 24),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: EdgeInsets.all(largeFont ? 20 : 16),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: accentColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("12", "Clases"),
          _buildStatItem("35", "Horas"),
          _buildStatItem("24", "Estudiantes"),
          _buildStatItem(tutor.calificacion.toStringAsFixed(1), "Rating"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: getTextStyle(true).copyWith(color: primaryColor),
        ),
        Text(
          label,
          style: getTextStyle(false).copyWith(color: secondaryColor),
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
          style: getTextStyle(true).copyWith(color: primaryColor),
        ),
        SizedBox(height: largeFont ? 16 : 12),
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
        style: getTextStyle(false).copyWith(color: primaryColor),
      ),
      backgroundColor: accentColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: accentColor),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: largeFont ? 24 : 20),
      child: Container(
        padding: EdgeInsets.all(largeFont ? 20 : 16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: accentColor.withOpacity(0.3),
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
                  style: getTextStyle(true).copyWith(color: primaryColor),
                ),
                Row(
                  children: [
                    Text(
                      tutor.calificacion.toStringAsFixed(1),
                      style: getTextStyle(true).copyWith(color: secondaryColor),
                    ),
                    SizedBox(width: largeFont ? 8 : 4),
                    Icon(Icons.star, color: Colors.amber, size: largeFont ? 24 : 20),
                  ],
                ),
              ],
            ),
            SizedBox(height: largeFont ? 16 : 12),
            LinearProgressIndicator(
              value: tutor.calificacion / 5,
              minHeight: largeFont ? 10 : 8,
              borderRadius: BorderRadius.circular(10),
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              backgroundColor: accentColor.withOpacity(0.3),
            ),
            SizedBox(height: largeFont ? 12 : 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "5 estrellas (${(tutor.calificacion * 20).toInt()}%)",
                  style: getTextStyle(false),
                ),
                Text(
                  "24 reseñas",
                  style: getTextStyle(false),
                ),
              ],
            ),
            SizedBox(height: largeFont ? 20 : 16),
            Text(
              "¿Cómo fue tu experiencia con ${tutor.nombre.split(' ')[0]}?",
              style: getTextStyle(false).copyWith(
                fontStyle: FontStyle.italic,
                color: secondaryColor,
              ),
            ),
            SizedBox(height: largeFont ? 16 : 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < tutor.calificacion.floor() ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: largeFont ? 36 : 30,
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
      padding: EdgeInsets.all(largeFont ? 24 : 20),
      child: Column(
        children: [
          Text(
            "Contacta a ${tutor.nombre.split(' ')[0]}",
            style: getTextStyle(true).copyWith(color: primaryColor),
          ),
          SizedBox(height: largeFont ? 20 : 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactButton(
                icon: Icons.email,
                label: "Email",
                color: secondaryColor,
                onPressed: () => _showContactDialog(context, "Email"),
              ),
              _buildContactButton(
                icon: Icons.phone,
                label: "Llamar",
                color: primaryColor,
                onPressed: () => _showContactDialog(context, "Teléfono"),
              ),
              _buildContactButton(
                icon: Icons.video_call,
                label: "Video",
                color: Colors.green,
                onPressed: () => _showContactDialog(context, "Videollamada"),
              ),
            ],
          ),
          SizedBox(height: largeFont ? 28 : 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: largeFont ? 20 : 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () => _showConfirmationDialog(context),
              child: Text(
                'Reservar Sesión',
                style: getTextStyle(true).copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Container(
          width: largeFont ? 60 : 50,
          height: largeFont ? 60 : 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.white, size: largeFont ? 28 : 24),
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: largeFont ? 8 : 4),
        Text(
          label,
          style: getTextStyle(false),
        ),
      ],
    );
  }

  void _showAccessibilityOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardColor,
        title: Text('Configuración', style: getTextStyle(true)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: Text('Texto grande', style: getTextStyle(false)),
              value: largeFont,
              onChanged: (value) {
                Navigator.pop(context);
                // Deberías manejar este cambio en el estado padre
              },
            ),
            SwitchListTile(
              title: Text('Modo oscuro', style: getTextStyle(false)),
              value: darkMode,
              onChanged: (value) {
                Navigator.pop(context);
                // Deberías manejar este cambio en el estado padre
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cerrar', style: getTextStyle(false, true)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context, String method) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardColor,
        title: Text(
          "Contactar por $method",
          style: getTextStyle(true),
        ),
        content: Text(
          "¿Deseas contactar a ${tutor.nombre} por $method?\n\n${method == "Email" ? "tutor.email@example.com" : method == "Teléfono" ? "+52 55 1234 5678" : "Iniciar videollamada"}",
          style: getTextStyle(false),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancelar",
              style: getTextStyle(false, true).copyWith(color: secondaryColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Conectando con ${tutor.nombre} por $method..."),
                  backgroundColor: primaryColor,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Text(
              "Confirmar",
              style: getTextStyle(false, true).copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardColor,
        title: Text(
          "Confirmar Reservación",
          style: getTextStyle(true),
        ),
        content: Text(
          "¿Deseas reservar una sesión con este tutor?",
          style: getTextStyle(false),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancelar",
              style: getTextStyle(false, true).copyWith(color: secondaryColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Sesión reservada con ${tutor.nombre}!"),
                  backgroundColor: primaryColor,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Text(
              "Confirmar",
              style: getTextStyle(false, true).copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}