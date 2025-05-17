import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorariosEstudianteScreen extends StatefulWidget {
  @override
  _HorariosEstudianteScreenState createState() => _HorariosEstudianteScreenState();
}

class _HorariosEstudianteScreenState extends State<HorariosEstudianteScreen> {
  // Paleta de colores original
  final Color _primaryGreen = const Color(0xFF8BA888);
  final Color _lightBeige = const Color(0xFFF5F1E6);
  final Color _darkBrown = const Color(0xFF5E4B3D);
  final Color _warmBeige = const Color(0xFFD8CCA3);

  // Configuración accesibilidad
  bool _largeFont = false;
  bool _darkMode = false;
  
  // Datos para formulario
  final List<String> _modalidades = ['Presencial', 'Virtual'];
  final List<String> _profesores = [
    'Prof. Juan Pérez',
    'Prof. María Gómez',
    'Prof. Carlos Ruiz'
  ];
  final List<String> _ubicacionesVirtuales = ['Teams', 'Zoom', 'Meet', 'Skype'];
  final List<String> _salonesPresenciales = [
    'Salón 101',
    'Salón 202',
    'Laboratorio 3',
    'Biblioteca'
  ];

  // Tutorías de ejemplo
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
      'id': '1',
      'materia': 'Teoría de grafos',
      'tutor': 'Prof. Carlos Ruiz',
      'fecha': DateTime.now().add(const Duration(days: 1)),
      'horaInicio': '18:00',
      'horaFin': '20:30',
      'estado': 'Confirmada',
      'modalidad': 'Virtual',
      'ubicacion': 'Teams',
    },
  ];

  // Estilos de texto dinámicos
  TextStyle _getTextStyle(bool isTitle, [bool isButton = false]) {
    return TextStyle(
      fontSize: _largeFont 
          ? (isTitle ? 22.0 : 18.0) 
          : (isTitle ? 16.0 : 14.0),
      fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      color: _darkMode ? _warmBeige : _darkBrown,
    );
  }

  // Diálogo configuración accesibilidad
  void _showAccessibilitySettings() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _darkMode ? _darkBrown : _lightBeige,
        title: Text('Configuración', style: _getTextStyle(true)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: Text('Texto grande', style: _getTextStyle(false)),
              value: _largeFont,
              onChanged: (value) => setState(() => _largeFont = value),
            ),
            SwitchListTile(
              title: Text('Modo oscuro', style: _getTextStyle(false)),
              value: _darkMode,
              onChanged: (value) => setState(() => _darkMode = value),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cerrar', style: _getTextStyle(false, true)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

void _mostrarDialogoAgendar() {
  final _formKey = GlobalKey<FormState>();
  String materia = '';
  String tutor = _profesores.first;
  DateTime fecha = DateTime.now();
  TimeOfDay horaInicio = TimeOfDay(hour: 10, minute: 0);
  TimeOfDay horaFin = TimeOfDay(hour: 11, minute: 0);
  String modalidad = _modalidades.first;
  String ubicacion = modalidad == 'Virtual' 
      ? _ubicacionesVirtuales.first 
      : _salonesPresenciales.first;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (dialogContext, dialogSetState) {
          return AlertDialog(
          backgroundColor: _darkMode ? _darkBrown : _lightBeige,
          title: Text('Nueva tutoría', style: _getTextStyle(true)),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Campo materia
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Materia',
                      labelStyle: _getTextStyle(false),
                    ),
                    style: _getTextStyle(false),
                    validator: (value) => 
                        value?.isEmpty ?? true ? 'Campo requerido' : null,
                    onChanged: (value) => materia = value,
                  ),
                  SizedBox(height: _largeFont ? 16 : 12),

                  // Selector profesor
                  DropdownButtonFormField<String>(
                    value: tutor,
                    items: _profesores.map((prof) => 
                      DropdownMenuItem<String>(
                        value: prof,
                        child: Text(prof, style: _getTextStyle(false)),
                      )).toList(),
                    onChanged: (value) => setState(() => tutor = value!),
                    decoration: InputDecoration(
                      labelText: 'Tutor',
                      labelStyle: _getTextStyle(false),
                    ),
                    style: _getTextStyle(false),
                    validator: (value) => 
                        value == null ? 'Seleccione un tutor' : null,
                  ),
                  SizedBox(height: _largeFont ? 16 : 12),

                  // Selector fecha
                  ListTile(
                    title: Text(
                      'Fecha: ${DateFormat.yMMMd().format(fecha)}',
                      style: _getTextStyle(false),
                    ),
                    trailing: Icon(
                      Icons.calendar_today,
                      size: _largeFont ? 28 : 24,
                      color: _darkMode ? _warmBeige : _darkBrown,
                    ),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: fecha,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        builder: (context, child) => Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: _primaryGreen,
                              onPrimary: Colors.white,
                              surface: _darkMode ? _darkBrown : _lightBeige,
                            ),
                            dialogBackgroundColor: 
                                _darkMode ? _darkBrown : _lightBeige,
                          ),
                          child: child!,
                        ),
                      );
                      if (picked != null) setState(() => fecha = picked);
                    },
                  ),

                  // Selector hora inicio
                  ListTile(
                    title: Text(
                      'Hora inicio: ${horaInicio.format(context)}',
                      style: _getTextStyle(false),
                    ),
                    trailing: Icon(
                      Icons.access_time,
                      size: _largeFont ? 28 : 24,
                      color: _darkMode ? _warmBeige : _darkBrown,
                    ),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: horaInicio,
                      );
                      if (picked != null) setState(() => horaInicio = picked);
                    },
                  ),

                  // Selector hora fin
                  ListTile(
                    title: Text(
                      'Hora fin: ${horaFin.format(context)}',
                      style: _getTextStyle(false),
                    ),
                    trailing: Icon(
                      Icons.access_time,
                      size: _largeFont ? 28 : 24,
                      color: _darkMode ? _warmBeige : _darkBrown,
                    ),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: horaFin,
                      );
                      if (picked != null) setState(() => horaFin = picked);
                    },
                  ),
                  SizedBox(height: _largeFont ? 16 : 12),

                  // Selector modalidad
                  // Selector modalidad corregido
                    DropdownButtonFormField<String>(
                      value: modalidad,
                      items: _modalidades.map((mod) => 
                        DropdownMenuItem<String>(
                          value: mod,
                          child: Text(mod, style: _getTextStyle(false)),
                        )).toList(),
                      onChanged: (value) {
                        dialogSetState(() {  // Cambiado de setState a dialogSetState
                          modalidad = value!;
                          ubicacion = modalidad == 'Virtual' 
                              ? _ubicacionesVirtuales.first 
                              : _salonesPresenciales.first;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Modalidad',
                        labelStyle: _getTextStyle(false),
                      ),
                      style: _getTextStyle(false),
                      validator: (value) => value == null ? 'Seleccione modalidad' : null,
                    ),
                  SizedBox(height: _largeFont ? 16 : 12),

                  // Selector ubicación (dinámico)
                  DropdownButtonFormField<String>(
                    value: ubicacion,
                    items: (modalidad == 'Virtual' 
                            ? _ubicacionesVirtuales 
                            : _salonesPresenciales)
                        .map((ubic) => DropdownMenuItem<String>(
                              value: ubic,
                              child: Text(ubic, style: _getTextStyle(false)),
                            )).toList(),
                    onChanged: (value) => setState(() => ubicacion = value!),
                    decoration: InputDecoration(
                      labelText: modalidad == 'Virtual' 
                          ? 'Plataforma' 
                          : 'Salón',
                      labelStyle: _getTextStyle(false),
                    ),
                    style: _getTextStyle(false),
                    validator: (value) => 
                        value == null ? 'Seleccione ubicación' : null,
                  ),
                ],
              ),
            ),
          ),
            actions: [
              TextButton(
                child: Text('Cancelar', style: _getTextStyle(false, true)),
                onPressed: () => Navigator.pop(dialogContext),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryGreen,
                  padding: EdgeInsets.symmetric(
                    horizontal: _largeFont ? 24 : 16,
                    vertical: 12,
                  ),
                ),
                child: Text('Guardar', style: _getTextStyle(false, true)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nuevaTutoria = {
                      'id': DateTime.now().millisecondsSinceEpoch.toString(),
                      'materia': materia,
                      'tutor': tutor,
                      'fecha': fecha,
                      'horaInicio': horaInicio.format(context),
                      'horaFin': horaFin.format(context),
                      'estado': 'Pendiente',
                      'modalidad': modalidad,
                      'ubicacion': ubicacion,
                    };
                    
                    Navigator.pop(dialogContext); // Eliminado el await
                    
                    if (mounted) {
                      setState(() {
                        _tutoriasAgendadas.insert(0, nuevaTutoria);
                      });
                    }
                  }
                },
              ),
            ],
          );
        },
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkMode ? _darkBrown : _lightBeige,
      appBar: AppBar(
        backgroundColor: _darkMode ? Color(0xFF4A3C2D) : _primaryGreen,
        title: Text('Mis Tutorías', style: _getTextStyle(true)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_accessibility,
                size: _largeFont ? 28 : 24),
            onPressed: _showAccessibilitySettings,
            tooltip: 'Configuración accesibilidad',
          ),
          IconButton(
            icon: Icon(Icons.add, size: _largeFont ? 28 : 24),
            onPressed: _mostrarDialogoAgendar,
            tooltip: 'Agendar tutoría',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tutoriasAgendadas.length,
        itemBuilder: (context, index) {
          final tutoria = _tutoriasAgendadas[index];
          return Card(
            color: _darkMode ? Color(0xFF4A3C2D) : _warmBeige,
            margin: EdgeInsets.all(_largeFont ? 12 : 8),
            elevation: 2,
            child: ListTile(
              contentPadding: EdgeInsets.all(_largeFont ? 16 : 12),
              title: Text(
                '${tutoria['materia']} - ${tutoria['tutor']}',
                style: _getTextStyle(true),
              ),
              subtitle: Text(
                'Fecha: ${DateFormat.yMMMd().format(tutoria['fecha'])}\n'
                'Hora: ${tutoria['horaInicio']} - ${tutoria['horaFin']}\n'
                'Modalidad: ${tutoria['modalidad']} (${tutoria['ubicacion']})\n'
                'Estado: ${tutoria['estado']}',
                style: _getTextStyle(false),
              ),
              isThreeLine: true,
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: _largeFont ? 20 : 16,
                color: _darkMode ? _warmBeige : _darkBrown,
              ),
            ),
          );
        },
      ),
    );
  }
}