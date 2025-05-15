import 'package:flutter/material.dart';
import 'package:tutor_tree/models/mensaje_model.dart'; // Asumiendo que tienes este modelo

class MensajesTutorScreen extends StatefulWidget {
  const MensajesTutorScreen({Key? key}) : super(key: key);

  @override
  _MensajesTutorScreenState createState() => _MensajesTutorScreenState();
}

class _MensajesTutorScreenState extends State<MensajesTutorScreen> {
  // Lista de mensajes de ejemplo
  final List<Mensaje> _mensajes = [
    Mensaje(
      remitente: 'Juan Pérez',
      asunto: 'Consulta sobre matemáticas',
      contenido: 'Hola, tengo dudas sobre el tema de derivadas...',
      fecha: DateTime.now().subtract(Duration(minutes: 30)),
      leido: false,
    ),
    Mensaje(
      remitente: 'María Gómez',
      asunto: 'Solicitud de tutoría',
      contenido: 'Buen día, quisiera agendar una sesión para...',
      fecha: DateTime.now().subtract(Duration(hours: 2)),
      leido: true,
    ),
    // Agrega más mensajes según necesites
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensajes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implementar búsqueda
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFiltros(),
          Expanded(
            child: ListView.builder(
              itemCount: _mensajes.length,
              itemBuilder: (context, index) {
                return _buildItemMensaje(_mensajes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltros() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar mensajes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Mostrar opciones de filtrado
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItemMensaje(Mensaje mensaje) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: mensaje.leido ? Colors.grey[100] : Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(mensaje.remitente[0]),
        ),
        title: Text(
          mensaje.remitente,
          style: TextStyle(
            fontWeight: mensaje.leido ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(mensaje.asunto),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${mensaje.fecha.hour}:${mensaje.fecha.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            if (!mensaje.leido)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {
          _mostrarDetalleMensaje(mensaje);
        },
      ),
    );
  }

  void _mostrarDetalleMensaje(Mensaje mensaje) {
    setState(() {
      mensaje.leido = true;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mensaje.asunto),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'De: ${mensaje.remitente}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                mensaje.contenido,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Enviado: ${mensaje.fecha.toString()}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Responder'),
              onPressed: () {
                Navigator.pop(context);
                _mostrarFormularioRespuesta(mensaje.remitente);
              },
            ),
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void _mostrarFormularioRespuesta(String destinatario) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Responder a $destinatario'),
          content: TextField(
            controller: _controller,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Escribe tu respuesta...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('Enviar'),
              onPressed: () {
                // Aquí implementarías el envío del mensaje
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mensaje enviado')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}