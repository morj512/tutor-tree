import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorariosEstudianteScreen extends StatefulWidget {
  @override
  _HorariosEstudianteScreenState createState() =>
      _HorariosEstudianteScreenState();
}

class _HorariosEstudianteScreenState extends State<HorariosEstudianteScreen> {
  final Color _primaryGreen = const Color(0xFF8BA888);
  final Color _lightBeige = const Color(0xFFF5F1E6);
  final Color _darkBrown = const Color(0xFF5E4B3D);
  final Color _softBlue = const Color(0xFFA7BED3);
  final Color _warmBeige = const Color(0xFFD8CCA3);

  DateTime _selectedDate = DateTime.now();

  final List<Map<String, dynamic>> _tutoriasAgendadas = [
    {
      'id': '1',
      'materia': 'Matemáticas Discretas',
      'tutor': 'Prof. Juan Pérez',
      'fecha': DateTime.now().add(const Duration(days: 1)),
      'horaInicio': '14:00',
      'horaFin': '15:30',
      'estado': 'Confirmada',
      'modalidad': 'Virtual',
      'ubicacion': 'Teams',
    },
    {
      'id': '2',
      'materia': 'Ecuaciones Diferenciales',
      'tutor': 'Prof. María Gómez',
      'fecha': DateTime.now().add(const Duration(days: 2)),
      'horaInicio': '10:00',
      'horaFin': '11:00',
      'estado': 'Pendiente',
      'modalidad': 'Virtual',
      'ubicacion': 'Zoom',
    },
    {
      'id': '3',
      'materia': 'Álgebra Lineal',
      'tutor': 'Prof. Carlos Ruiz',
      'fecha': DateTime.now().add(const Duration(days: 3)),
      'horaInicio': '16:00',
      'horaFin': '17:30',
      'estado': 'Confirmada',
      'modalidad': 'Virtual',
      'ubicacion': 'Meet',
    },
  ];

  void _mostrarDialogoAgendar() {
    final _formKey = GlobalKey<FormState>();
    String materia = '';
    String tutor = '';
    DateTime fecha = DateTime.now();
    TimeOfDay horaInicio = TimeOfDay(hour: 10, minute: 0);
    TimeOfDay horaFin = TimeOfDay(hour: 11, minute: 0);
    String modalidad = '';
    String ubicacion = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _lightBeige,
        title: const Text('Nueva tutoría'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Materia'),
                  onChanged: (value) => materia = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Tutor'),
                  onChanged: (value) => tutor = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: Text('Fecha: ${DateFormat.yMMMd().format(fecha)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? seleccionada = await showDatePicker(
                      context: context,
                      initialDate: fecha,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (seleccionada != null) {
                      setState(() => fecha = seleccionada);
                    }
                  },
                ),
                ListTile(
                  title: Text('Hora inicio: ${horaInicio.format(context)}'),
                  trailing: const Icon(Icons.access_time),
                  onTap: () async {
                    TimeOfDay? seleccionada = await showTimePicker(
                      context: context,
                      initialTime: horaInicio,
                    );
                    if (seleccionada != null) {
                      setState(() => horaInicio = seleccionada);
                    }
                  },
                ),
                ListTile(
                  title: Text('Hora fin: ${horaFin.format(context)}'),
                  trailing: const Icon(Icons.access_time),
                  onTap: () async {
                    TimeOfDay? seleccionada = await showTimePicker(
                      context: context,
                      initialTime: horaFin,
                    );
                    if (seleccionada != null) {
                      setState(() => horaFin = seleccionada);
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Modalidad'),
                  onChanged: (value) => modalidad = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ubicación'),
                  onChanged: (value) => ubicacion = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: _primaryGreen),
            child: const Text('Guardar'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _tutoriasAgendadas.add({
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    'materia': materia,
                    'tutor': tutor,
                    'fecha': fecha,
                    'horaInicio': horaInicio.format(context),
                    'horaFin': horaFin.format(context),
                    'estado': 'Pendiente',
                    'modalidad': modalidad,
                    'ubicacion': ubicacion,
                  });
                });
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lightBeige,
      appBar: AppBar(
        backgroundColor: _primaryGreen,
        title: const Text('Mis Tutorías'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgendar,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tutoriasAgendadas.length,
        itemBuilder: (context, index) {
          final tutoria = _tutoriasAgendadas[index];
          return Card(
            color: _warmBeige,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                '${tutoria['materia']} - ${tutoria['tutor']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Fecha: ${DateFormat.yMMMd().format(tutoria['fecha'])}\n'
                'Hora: ${tutoria['horaInicio']} - ${tutoria['horaFin']}\n'
                'Modalidad: ${tutoria['modalidad']} (${tutoria['ubicacion']})\n'
                'Estado: ${tutoria['estado']}',
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
