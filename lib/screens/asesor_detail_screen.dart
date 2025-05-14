// lib/screens/asesor_detail_screen.dart
import 'package:flutter/material.dart';
import 'asesores_screen.dart'; // Importamos el modelo Tutor

class AsesorDetailScreen extends StatelessWidget {
  final Tutor tutor;

  const AsesorDetailScreen({super.key, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(tutor.imagen),
                ),
              ),
              const SizedBox(height: 16),
              _buildTitleSection(tutor.nombre),
              _buildMetricsSection(tutor.especialidad, tutor.descripcion),
              _buildRatingSection(),
              _buildAdditionalMerchantSection(tutor.nombre),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(String nombre) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Text(
        nombre,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMetricsSection(String especialidad, String descripcion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Información del Tutor",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildMetricItem("Especialidad: $especialidad"),
        _buildMetricItem("Descripción: $descripcion"),
        _buildMetricItem("Clases disponibles: 12"),
        _buildMetricItem("Horas de tutoría: 35"),
      ],
    );
  }

  Widget _buildMetricItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8),
          const SizedBox(width: 8),
          Flexible(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "(En general, cómo calificarías al tutor según tu experiencia)",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        Row(
          children: const [
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star_border, color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalMerchantSection(String nombre) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
          child: Text(
            "Contacto del tutor",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('Emailar a $nombre');
          },
          child: const Text(
            "Emailar",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              print('Iniciar chat con $nombre');
            },
            child: const Text('Iniciar Chat'),
          ),
        ),
      ],
    );
  }
}
