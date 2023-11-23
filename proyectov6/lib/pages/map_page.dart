import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:proyectov6/pages/compass_page.dart';
import 'package:proyectov6/pages/home_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = Location();

  static const LatLng _pGooglePlex = LatLng(16.9961646541408, -96.75261015396188);
  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

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
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex,
          zoom: 15,
        ),
        markers: _currentP != null
            ? {
                Marker(
                  markerId: MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP!,
                ),
              }
            : {},
      ),
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

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(_currentP);
        });
      }
    });
  }
}
