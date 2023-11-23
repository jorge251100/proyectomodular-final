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
  String accelerometerValues = 'Unknown';
  String gyroscopeValues = 'Unknown';
  String magnetometerValues = 'Unknown';

  @override
  void initState() {
    super.initState();
    // Inicia la escucha de los sensores al cargar la aplicación
    startListening();
  }

  void startListening() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        accelerometerValues = 'X: ${event.x.toStringAsFixed(2)}, Y: ${event.y.toStringAsFixed(2)}, Z: ${event.z.toStringAsFixed(2)}';
      });
    });

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        gyroscopeValues = 'X: ${event.x.toStringAsFixed(2)}, Y: ${event.y.toStringAsFixed(2)}, Z: ${event.z.toStringAsFixed(2)}';
      });
    });

    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        magnetometerValues = 'X: ${event.x.toStringAsFixed(2)}, Y: ${event.y.toStringAsFixed(2)}, Z: ${event.z.toStringAsFixed(2)}';
      });
    });
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
              SensorCard(
                title: 'Accelerometer',
                value: accelerometerValues,
              ),
              SensorCard(
                title: 'Gyroscope',
                value: gyroscopeValues,
              ),
              SensorCard(
                title: 'Magnetometer',
                value: magnetometerValues,
              ),
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

class SensorCard extends StatelessWidget {
  final String title;
  final String value;

  SensorCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
