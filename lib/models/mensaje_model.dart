import 'package:flutter/material.dart';

class Mensaje {
  final String remitente;
  final String asunto;
  final String contenido;
  final DateTime fecha;
  bool leido;

  Mensaje({
    required this.remitente,
    required this.asunto,
    required this.contenido,
    required this.fecha,
    this.leido = false,
  });
}