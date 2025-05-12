// lib/services/openai_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  static const _apiKey = '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'; // Reemplaza esto por tu clave real
  static const _url = 'https://api.openai.com/v1/chat/completions';

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "Eres un tutor experto en matemáticas que recomienda temas, ejemplos y asesores."},
            {"role": "user", "content": message},
          ],
          "max_tokens": 150,
          "temperature": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final content = data['choices'][0]['message']['content'];
        return content.trim();
      } else {
        print('Error status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return "Lo siento, hubo un error al conectar con el tutor.";
      }
    } catch (e) {
      print('Exception: $e');
      return "Lo siento, hubo un error al conectar con el tutor.";
    }
  }
}
