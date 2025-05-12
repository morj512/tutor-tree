// huggingface_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class HuggingFaceService {
  static const String _apiKey = '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'; // Mueve esto a variables de entorno
  static const String _apiUrl = 'https://api-inference.huggingface.co/models/microsoft/DialoGPT-medium';

  Future<String> obtenerRespuesta(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"inputs": prompt, "options": {"wait_for_model": true}}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data[0]['generated_text'] ?? "No se pudo obtener respuesta";
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Error de conexión: $e";
    }
  }
}