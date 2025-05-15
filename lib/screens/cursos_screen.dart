import 'package:flutter/material.dart';

class CursosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cursos de HCI', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.brown[700],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Función de búsqueda
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.brown.shade50],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildCourseCard(context, 'Diseño de Interfaces Centrado en el Usuario',
                'Principios de UX/UI, investigación con usuarios, prototipado', Icons.design_services, Colors.green[800]!),
            SizedBox(height: 16),
            _buildCourseCard(context, 'Evaluación de Usabilidad',
                'Métricas de usabilidad, pruebas con usuarios, análisis heurístico', Icons.assessment, Colors.brown),
            SizedBox(height: 16),
            _buildCourseCard(context, 'Interacción Persona-Computadora',
                'Modelos de interacción, psicología cognitiva, accesibilidad', Icons.psychology, Colors.teal[700]!),
            SizedBox(height: 16),
            _buildCourseCard(context, 'Diseño de Experiencia de Usuario Avanzado',
                'Journey maps, arquitectura de información, diseño emocional', Icons.emoji_objects, Colors.green[900]!),
            SizedBox(height: 16),
            _buildCourseCard(context, 'Tecnologías de Interacción Emergentes',
                'Realidad aumentada, interfaces gestuales, voz como interfaz', Icons.devices_other, Colors.brown[600]!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para agregar nuevo curso
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _showCourseDetails(context, title, description);
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 30),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 16),
                        Icon(Icons.schedule, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Text('8 semanas', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCourseDetails(BuildContext context, String title, String description) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'Contenido del curso:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 12),
            _buildDetailItem('Módulo 1: Fundamentos de HCI'),
            _buildDetailItem('Módulo 2: Métodos de investigación'),
            _buildDetailItem('Módulo 3: Principios de diseño'),
            _buildDetailItem('Módulo 4: Evaluación de usabilidad'),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Inscribirse en el curso',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 20),
          SizedBox(width: 12),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
