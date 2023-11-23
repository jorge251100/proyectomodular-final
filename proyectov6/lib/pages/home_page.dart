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

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logged in as " + user.email!,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a map_page.dart utilizando MaterialPageRoute
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage()));
              },
              child: Text('Go to Map Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a map_page.dart utilizando MaterialPageRoute
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompassPage()));
              },
              child: Text('Go to Compass Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a map_page.dart utilizando MaterialPageRoute
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SensorsPage()));
              },
              child: Text('Go to Sensors Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a map_page.dart utilizando MaterialPageRoute
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoList()));
              },
              child: Text('Go to the to do list'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a map_page.dart utilizando MaterialPageRoute
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Photo()));
              },
              child: Text('Go to the camera'),
            ),
          ],
        ),
      ),
    );
  }
}