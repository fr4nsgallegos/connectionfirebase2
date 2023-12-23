import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> myMarkers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: myMarkers,
        //1 solo marcador
        // {
        //   Marker(
        //     markerId: MarkerId("value"),
        //     position: LatLng(
        //       -12.073715417736464,
        //       -77.01593825800173,
        //     ),
        //   )
        // },
        onTap: (LatLng position) {
          Marker marker = Marker(
            markerId: MarkerId(myMarkers.length.toString()),
            position: position,
          );
          myMarkers.add(marker);
          setState(() {});
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            -12.073715417736464,
            -77.01593825800173,
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
