import 'package:flutter/material.dart';
import 'package:tutor_tree/models/horario_model.dart';
import 'package:tutor_tree/models/mensaje_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';



class HorariosTutorScreen extends StatefulWidget {
  const HorariosTutorScreen({Key? key}) : super(key: key);

  @override
  _HorariosTutorScreenState createState() => _HorariosTutorScreenState();
}

class _HorariosTutorScreenState extends State<HorariosTutorScreen> {
  DateTime _fechaSeleccionada = DateTime.now();
  final List<Horario> _horarios = [
    Horario(
      id: '1',
      dia: DateTime.monday,
      horaInicio: const TimeOfDay(hour: 9, minute: 0),
      horaFin: const TimeOfDay(hour: 11, minute: 0),
      materia: 'Matemáticas Avanzadas',
      estudiante: 'Juan Pérez',
    ),
    Horario(
      id: '2',
      dia: DateTime.wednesday,
      horaInicio: const TimeOfDay(hour: 14, minute: 0),
      horaFin: const TimeOfDay(hour: 16, minute: 0),
      materia: 'Física Cuántica',
      estudiante: 'María Gómez',
    ),
    Horario(
      id: '3',
      dia: DateTime.friday,
      horaInicio: const TimeOfDay(hour: 10, minute: 0),
      horaFin: const TimeOfDay(hour: 12, minute: 0),
      materia: 'Programación',
      estudiante: 'Carlos Ruiz',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Horarios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarFormularioNuevoHorario,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSelectorFecha(),
          Expanded(
            child: _buildListaHorarios(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectorFecha() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _fechaSeleccionada = _fechaSeleccionada.subtract(const Duration(days: 1));
              });
            },
          ),
          TextButton(
            onPressed: () async {
              final DateTime? fecha = await showDatePicker(
                context: context,
                initialDate: _fechaSeleccionada,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (fecha != null) {
                setState(() {
                  _fechaSeleccionada = fecha;
                });
              }
            },
            child: Text(
              DateFormat('EEEE, d MMMM y', 'es_ES').format(_fechaSeleccionada),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _fechaSeleccionada = _fechaSeleccionada.add(const Duration(days: 1));
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListaHorarios() {
    final horariosDelDia = _horarios.where((horario) => horario.dia == _fechaSeleccionada.weekday).toList();

    if (horariosDelDia.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today, size: 50, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'No hay horarios programados',
              style: TextStyle(color: Colors.grey[600]),
            ),
            TextButton(
              onPressed: _mostrarFormularioNuevoHorario,
              child: const Text('Agregar horario'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: horariosDelDia.length,
      itemBuilder: (context, index) {
        return _buildItemHorario(horariosDelDia[index]);
      },
    );
  }

  Widget _buildItemHorario(Horario horario) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.schedule, color: Colors.blue),
        title: Text(horario.materia),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estudiante: ${horario.estudiante}'),
            const SizedBox(height: 4),
            Text(
              '${horario.horaInicio.format(context)} - ${horario.horaFin.format(context)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.grey),
          onPressed: () => _mostrarFormularioEditarHorario(horario),
        ),
      ),
    );
  }

  void _mostrarFormularioNuevoHorario() {
    final _formKey = GlobalKey<FormState>();
    final _materiaController = TextEditingController();
    final _estudianteController = TextEditingController();
    TimeOfDay? _horaInicio;
    TimeOfDay? _horaFin;
    int? _diaSeleccionado;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nuevo Horario'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(labelText: 'Día de la semana'),
                    items: [
                      const DropdownMenuItem(
                        value: DateTime.monday,
                        child: Text('Lunes'),
                      ),
                      const DropdownMenuItem(
                        value: DateTime.tuesday,
                        child: Text('Martes'),
                      ),
                      const DropdownMenuItem(
                        value: DateTime.wednesday,
                        child: Text('Miércoles'),
                      ),
                      const DropdownMenuItem(
                        value: DateTime.thursday,
                        child: Text('Jueves'),
                      ),
                      const DropdownMenuItem(
                        value: DateTime.friday,
                        child: Text('Viernes'),
                      ),
                      const DropdownMenuItem(
                        value: DateTime.saturday,
                        child: Text('Sábado'),
                      ),
                      const DropdownMenuItem(
                        value: DateTime.sunday,
                        child: Text('Domingo'),
                      ),
                    ],
                    onChanged: (value) {
                      _diaSeleccionado = value;
                    },
                    validator: (value) => value == null ? 'Selecciona un día' : null,
                  ),
                  TextFormField(
                    controller: _materiaController,
                    decoration: const InputDecoration(labelText: 'Materia'),
                    validator: (value) => value?.isEmpty ?? true ? 'Ingresa la materia' : null,
                  ),
                  TextFormField(
                    controller: _estudianteController,
                    decoration: const InputDecoration(labelText: 'Estudiante'),
                    validator: (value) => value?.isEmpty ?? true ? 'Ingresa el estudiante' : null,
                  ),
                  ListTile(
                    title: Text(_horaInicio == null 
                        ? 'Seleccionar hora inicio' 
                        : 'Hora inicio: ${_horaInicio!.format(context)}'),
                    trailing: const Icon(Icons.access_time),
                    onTap: () async {
                      final hora = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (hora != null) {
                        setState(() {
                          _horaInicio = hora;
                        });
                      }
                    },
                  ),
                  ListTile(
                    title: Text(_horaFin == null 
                        ? 'Seleccionar hora fin' 
                        : 'Hora fin: ${_horaFin!.format(context)}'),
                    trailing: const Icon(Icons.access_time),
                    onTap: () async {
                      final hora = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (hora != null) {
                        setState(() {
                          _horaFin = hora;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    _horaInicio != null &&
                    _horaFin != null &&
                    _diaSeleccionado != null) {
                  final nuevoHorario = Horario(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    dia: _diaSeleccionado!,
                    horaInicio: _horaInicio!,
                    horaFin: _horaFin!,
                    materia: _materiaController.text,
                    estudiante: _estudianteController.text,
                  );
                  setState(() {
                    _horarios.add(nuevoHorario);
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Horario agregado')),
                  );
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarFormularioEditarHorario(Horario horario) {
    // Implementación similar a _mostrarFormularioNuevoHorario pero con valores iniciales
  }
}