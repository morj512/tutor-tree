import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String _apiKey = 'AIzaSyBs_sDJkoUlYVK2J7lQAOWDzR_L8Osacto'; // <-- pon tu API Key válida aquí

  Future<String> sendMessage(String message) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyBs_sDJkoUlYVK2J7lQAOWDzR_L8Osacto',
    );

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': message}
          ]
        }
      ]
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];
      return text ?? '⚠️ Respuesta vacía';
    } else {
      throw Exception(
          '❌ Error del servidor: ${response.statusCode} - ${response.body}');
    }
  }
}
