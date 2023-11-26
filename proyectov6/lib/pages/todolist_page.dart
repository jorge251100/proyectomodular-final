import 'package:flutter/material.dart';
import 'package:proyectov6/pages/sensors_page.dart';
import 'package:proyectov6/pages/camera_page.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward), // Icono de flecha a la derecha
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Photo()));
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icono de flecha a la izquierda
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SensorsPage()));
          },
        ),
      ),
    );
  }
}
