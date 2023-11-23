import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:proyectov6/pages/todolist_page.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  CameraController? _cameraController;
  List<CameraDescription> cameras = [];
  List<XFile> photos = [];
  bool cameraBusy = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController!.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> takePhoto() async {
    if (cameraBusy) {
      return;
    }
    cameraBusy = true;

    final XFile? image = await _cameraController!.takePicture();
    if (image != null) {
      setState(() {
        photos.add(image);
      });
    }

    cameraBusy = false;
  }

  List<Widget> buildGallery() {
    return List<Widget>.generate(photos.length, (index) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        child: Image.file(
          File(photos[index].path),
          fit: BoxFit.cover,
        ),
      );
    });
  }

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: _cameraController != null
                  ? CameraPreview(_cameraController!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          SizedBox(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: buildGallery(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takePhoto,
        child: Icon(Icons.camera),
        backgroundColor: Colors.blue, // Color de fondo del botón flotante
      ),
    );
  }
}
