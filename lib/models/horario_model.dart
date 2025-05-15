import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class Horario {
  final String id;
  final int dia; // DateTime.monday, DateTime.tuesday, etc.
  final TimeOfDay horaInicio;
  final TimeOfDay horaFin;
  final String materia;
  final String estudiante;

  Horario({
    required this.id,
    required this.dia,
    required this.horaInicio,
    required this.horaFin,
    required this.materia,
    required this.estudiante,
  });
}