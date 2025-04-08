import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
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
