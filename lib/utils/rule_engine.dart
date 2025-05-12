import 'package:tutor_tree/models/asesor.dart';

class RuleEngine {
  final Map<String, String> _topics = {
    'algebra': 'Algebra: Simplificación de expresiones, ecuaciones lineales...',
    'calculo': 'Cálculo: Derivadas, integrales, límites...',
    'geometria': 'Geometría: Ángulos, áreas, volúmenes...',
  };

  final Map<String, String> _examples = {
    'algebra': 'Ejemplo: Resuelve 2x + 3 = 7.',
    'calculo': 'Ejemplo: Deriva la función f(x) = x^2.',
    'geometria': 'Ejemplo: Calcula el área de un círculo con radio 5.',
  };

  final List<Asesor> _tutors = [
    Asesor(nombre: 'Juan Pérez', especialidad: 'Algebra'),
    Asesor(nombre: 'Ana Gómez', especialidad: 'Cálculo'),
    Asesor(nombre: 'Carlos Ruiz', especialidad: 'Geometría'),
  ];

  String processMessage(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('algebra')) {
      return _generateResponse('algebra');
    } else if (lowerMessage.contains('calculo')) {
      return _generateResponse('calculo');
    } else if (lowerMessage.contains('geometria')) {
      return _generateResponse('geometria');
    } else {
      return 'Lo siento, no tengo información sobre ese tema. ¿Te gustaría hablar de Álgebra, Cálculo o Geometría?';
    }
  }

  String _generateResponse(String topic) {
    final example = _examples[topic] ?? 'No hay ejemplos disponibles.';
    final tutor = _recommendTutor(topic);
    return '''
Tema: ${_topics[topic]}
Ejemplo: $example
Tutor recomendado: $tutor
''';
  }

  String _recommendTutor(String topic) {
    final tutor = _tutors.firstWhere(
      (t) => t.especialidad.toLowerCase() == topic,
      orElse: () => Asesor(nombre: 'N/A', especialidad: 'N/A'),
    );
    return tutor.nombre != 'N/A'
        ? '${tutor.nombre} (Especialista en ${tutor.especialidad})'
        : 'Lo siento, no tenemos un tutor disponible para este tema.';
  }

  Future<void> loadRules() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
