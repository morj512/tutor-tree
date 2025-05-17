import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


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