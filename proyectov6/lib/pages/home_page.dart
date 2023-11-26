import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectov6/pages/compass_page.dart';
import 'package:proyectov6/pages/map_page.dart';
import 'package:proyectov6/pages/sensors_page.dart';
import 'package:proyectov6/pages/todolist_page.dart';
import 'package:proyectov6/pages/camera_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop(); // Cerrar el Drawer al hacer logout
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Logged in as ' + user.email!,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            _buildDrawerButton('Map Page', Icons.map, () {
              Navigator.of(context).pop(); // Cerrar el Drawer al seleccionar
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage()));
            }),
            _buildDrawerButton('Compass Page', Icons.explore, () {
              Navigator.of(context).pop(); // Cerrar el Drawer al seleccionar
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompassPage()));
            }),
            _buildDrawerButton('Sensors Page', Icons.track_changes, () {
              Navigator.of(context).pop(); // Cerrar el Drawer al seleccionar
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SensorsPage()));
            }),
            _buildDrawerButton('To-Do List', Icons.checklist, () {
              Navigator.of(context).pop(); // Cerrar el Drawer al seleccionar
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoList()));
            }),
            _buildDrawerButton('Camera', Icons.camera, () {
              Navigator.of(context).pop(); // Cerrar el Drawer al seleccionar
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Photo()));
            }),
            _buildDrawerButton('Logout', Icons.logout, () {
              signUserOut(context);
            }),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logged in as ' + user.email!,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      leading: Icon(
        icon,
        size: 28,
      ),
      onTap: onTap,
    );
  }
}
