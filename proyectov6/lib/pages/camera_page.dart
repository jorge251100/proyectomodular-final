import 'package:flutter/material.dart';
import 'package:proyectov6/pages/todolist_page.dart';

class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        backgroundColor: Colors.blue, // Color de fondo de la barra de navegación
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Icono de flecha a la izquierda
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoList()));
          },
        ),
      ),
      body: Container(), // Contenido del cuerpo eliminado
    );
  }
}
