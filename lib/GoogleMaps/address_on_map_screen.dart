import 'dart:async';

import 'package:all_flutter_gives/GoogleMaps/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressOnMapScreen extends StatefulWidget {
  AddressOnMapScreen({Key key}) : super(key: key);

  @override
  _AddressOnMapScreenState createState() => _AddressOnMapScreenState();
}

class _AddressOnMapScreenState extends State<AddressOnMapScreen> {
  TextEditingController _searchController = new TextEditingController();

  // todo: Setting controller for the map
  Completer<GoogleMapController> _controller = Completer();

  // todo: Setting two locations on the map
  static final CameraPosition _home = CameraPosition(
    target: LatLng(6.6890322, 3.2698028),
    zoom: 15.1456,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(6.6899919, 3.2733869),
      tilt: 59.440717697143555,
      zoom: 15);

  // todo: Adding Markers
  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kLake'),
    infoWindow: InfoWindow(title: 'BreadSmith'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(6.6899919, 3.2733869),
  );

  static final Marker _homeMarker = Marker(
    markerId: MarkerId('_home'),
    infoWindow: InfoWindow(title: 'Home'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(6.6890322, 3.2698028),
  );

  // todo: Adding Polylines
  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(6.6890322, 3.2698028),
        LatLng(6.6899919, 3.2733869),
      ],
      width: 5);

  // todo: Adding Polygon : Drawing a line between 4 coordinates
  static final Polygon _kPolygon = Polygon(
      polygonId: PolygonId('_kPolygon'),
      points: [
        LatLng(6.6890322, 3.2698028),
        LatLng(6.6899919, 3.2733869),
        LatLng(6.686, 3.285),
        LatLng(6.670, 3.2753),
      ],
      strokeWidth: 5,
      fillColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Search by City'),
                  onChanged: (val) {
                    print(val);
                  },
                ),
              ),
              IconButton(
                  onPressed: () async {
                    // todo: Get the address of a place in the search bar, use the 'getPlace' method to convert the address to coordinates,
                    // todo: then, call the '_goToPlace' method to move the map to the location
                    var place = await LocationService()
                        .getPlace(_searchController.text);

                    _goToPlace(place);
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              trafficEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              polylines: {_kPolyline},
              polygons: {_kPolygon},
              initialCameraPosition: _home,
              markers: {_kLakeMarker, _homeMarker},
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Go Home'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    // todo: Animate to _kLake location
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    // todo: Animate to _kLake location
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
