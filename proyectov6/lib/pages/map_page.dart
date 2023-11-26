import 'package:flutter/material.dart';
import 'package:proyectov6/pages/compass_page.dart';
import 'package:proyectov6/pages/home_page.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
        actions: [
          _buildCompassPageButton(context), // Botón para ir a CompassPage
        ],
        leading: _buildHomePageButton(context), // Botón para ir a HomePage
      ),
      body: Container(), // Contenido del cuerpo eliminado
    );
  }

  Widget _buildCompassPageButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward), // Icono para ir a CompassPage
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompassPage()),
        );
      },
    );
  }

  Widget _buildHomePageButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), // Icono para ir a HomePage
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }
}
