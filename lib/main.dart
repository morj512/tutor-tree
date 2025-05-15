import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // 👈 Importar esto
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 👈 Necesario para usar async antes del runApp
  await initializeDateFormatting('es', null); // 👈 Inicializa la localización en español
  runApp(const TutorTreeApp());
}

class TutorTreeApp extends StatelessWidget {
  const TutorTreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutor Tree',
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
