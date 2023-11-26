import 'package:flutter/material.dart';
import 'package:proyectov6/pages/sensors_page.dart';
import 'package:proyectov6/pages/map_page.dart';

void main() => runApp(CompassPage());

class CompassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Compass'),
          actions: <Widget>[
            _buildMapPageButton(context),
          ],
          leading: _buildSensorsPageButton(context),
        ),
      ),
    );
  }

  Widget _buildSensorsPageButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage()),
        );
      },
    );
  }

  Widget _buildMapPageButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SensorsPage()),
        );
      },
    );
  }
}
