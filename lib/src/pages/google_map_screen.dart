import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  String mapTheme = "";

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(mapTheme);
  }
  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/map_styles/map_style.json").then((value) {
    mapTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}