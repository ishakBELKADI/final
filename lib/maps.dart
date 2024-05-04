import 'dart:async';

//import 'package:blood_donation/api/location.dart';
//import 'package:blood_donation/tools/bottom_navigation_bar.dart';
//import 'package:blood_donation/tools/card_post.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class maps extends StatelessWidget {
  Location location = Location();
  final posts = [
    {
      "name": "Brahmi Maya",
      "blood": "B+",
      "date": "12-04-2024",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "ameur lila",
      "blood": "B+",
      "date": "08-04-2024",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "missoum zineb",
      "blood": "B+",
      "date": "12-04-2024",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "Belkadi Zayn",
      "blood": "A+",
      "date": "12-04-2024",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "Belkadi adam",
      "blood": "B+",
      "date": "12-04-2024",
      "adress": "Hopital Beni Messous",
    }
  ];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(36.762744, 3.055855),
        infoWindow: InfoWindow(title: "Hopital Mustapha Bacha"))
  ];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.720357, 3.048924),
    zoom: 10,
  );
  maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 134, 183, 246),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(
                  context); // Revenir en arrière lorsque la flèche est pressée
            },
          ),
          title: Text(
            'Carte Google',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          // height: 400,

          child: GoogleMap(
            markers: markers.toSet(),
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              location._determinePosition();
            },
          ),
        ));
  }
}

class Location {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
