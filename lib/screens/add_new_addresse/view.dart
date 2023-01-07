import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddNewAddresseScreen extends StatefulWidget {
  const AddNewAddresseScreen({Key? key}) : super(key: key);

  @override
  State<AddNewAddresseScreen> createState() => _AddNewAddresseScreenState();
}

class _AddNewAddresseScreenState extends State<AddNewAddresseScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  Location location = Location();
  LatLng? cl;
  bool _serviceEnable = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  static const CameraPosition _kGooglePlex = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  initState() {
    getCurrentLocation();
    super.initState();
  }

  Set<Marker> myMarker = {};
  getCurrentLocation() async {
    _serviceEnable = await location.serviceEnabled();
    if (!_serviceEnable) {
      _serviceEnable = await location.requestService();
      if (!_serviceEnable) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    LatLng latLng =
        LatLng(_locationData?.latitude ?? 0, _locationData?.longitude ?? 0);
    _goToLatlng(latLng);
  }

  LatLng? modifyedLatlng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          // TODO: SAVE USER LOCATION FROM THIS BTN
          if (modifyedLatlng == null) {
            // TODO : SHOW error toast to set user location
          } else {
            Navigator.pop(context, modifyedLatlng);
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          height: 50,
          width: double.infinity,
          margin:
              const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
          child: const Text(
            'SAVE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: myMarker,
        buildingsEnabled: true,
        onTap: (latlng) {
          // _goToLatlng(latlng);
          setState(() {
            myMarker
                .add(Marker(markerId: const MarkerId('1'), position: latlng));
          });
        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToLatlng(LatLng latlng) async {
    modifyedLatlng = latlng;
    myMarker.add(Marker(markerId: const MarkerId('1'), position: latlng));
    setState(() {});
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latlng, zoom: 25.151926040649414)));
  }
}
