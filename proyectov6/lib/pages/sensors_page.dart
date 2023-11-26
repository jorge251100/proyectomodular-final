import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:proyectov6/pages/compass_page.dart';
import 'package:proyectov6/pages/todolist_page.dart';

void main() {
  runApp(SensorsPage());
}

class SensorsPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SensorsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sensor Example'),
          actions: <Widget>[
            _buildTodoListButton(context), // Botón superior derecho
          ],
          leading: _buildCompassButton(context), // Botón superior izquierdo
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Los widgets de los sensores se han eliminado para simplificar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompassButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompassPage()),
        );
      },
    );
  }

  Widget _buildTodoListButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TodoList()),
        );
      },
    );
  }
}
