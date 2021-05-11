import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Map_Screen extends StatefulWidget {
  @override
  MapScreen1State createState() => MapScreen1State();
}

class MapScreen1State extends State<Map_Screen> {
  Completer<GoogleMapController> _controller = Completer();

  //Location location = Location();
  @override
  void initState() {
    super.initState();
    //location.getCurrentLocation();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("Hyderabad"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(17.4554, 78.5008), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(17.4554, 78.5008), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://image.shutterstock.com/image-vector/vector-illustration-sugarcane-cane-logo-260nw-1290297556.jpg",
                  17.270251,
                  80.139274,
                  "Manikanta Mushrooms"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://image.shutterstock.com/image-vector/vector-illustration-sugarcane-cane-logo-260nw-1290297556.jpg",
                  17.088699,
                  79.241252,
                  "Mango Tree Farm"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://image.shutterstock.com/image-vector/vector-illustration-sugarcane-cane-logo-260nw-1290297556.jpg",
                  18.275768,
                  78.366629,
                  "Cotton Farm"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://image.shutterstock.com/image-vector/vector-illustration-sugarcane-cane-logo-260nw-1290297556.jpg",
                  18.789917,
                  78.89447,
                  "Organic Farm"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://image.shutterstock.com/image-vector/vector-illustration-sugarcane-cane-logo-260nw-1290297556.jpg",
                  17.467139,
                  78.441831,
                  "snehapoultry"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://image.shutterstock.com/image-vector/vector-illustration-sugarcane-cane-logo-260nw-1290297556.jpg",
                  17.373166,
                  78.497719,
                  "hakdairy"),
            ),


          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String placeName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(placeName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String placeName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              placeName,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
        CameraPosition(target: LatLng(17.4554, 78.5008), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          dsnrMarker,
          hakMarker,
          snehaMarker,
          mangoMarker,
          mushMarker,
          cottonMarker,
          organicMarker1,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker mushMarker = Marker(
  markerId: MarkerId('Manikanta Mushrooms'),
  position: LatLng(17.270251, 80.139374),
  infoWindow: InfoWindow(title: 'Manikanta Mushrooms'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

Marker mangoMarker = Marker(
  markerId: MarkerId('Mango Tree Farm'),
  position: LatLng(17.088699, 79.241252),
  infoWindow: InfoWindow(title: 'Mango Tree Farm'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker cottonMarker = Marker(
  markerId: MarkerId('Cotton Farm'),
  position: LatLng(18.275768, 78.366629),
  infoWindow: InfoWindow(title: 'Cotton Farm'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker organicMarker1 = Marker(
  markerId: MarkerId('Organic Farm'),
  position: LatLng(18.789917, 77.894497),
  infoWindow: InfoWindow(title: 'Organic Farm'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker snehaMarker = Marker(
  markerId: MarkerId('Sneha Poultry'),
  position: LatLng(17.467139, 78.441831),
  infoWindow: InfoWindow(title: 'Sneha Poultry'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker hakMarker = Marker(
  markerId: MarkerId('Hak Dairy'),
  position: LatLng(17.373166, 78.497719),
  infoWindow: InfoWindow(title: 'Hak Dairy'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker dsnrMarker = Marker(
  markerId: MarkerId('Dilsukhnagar'),
  position: LatLng(17.3685, 78.5316),
  infoWindow: InfoWindow(title: 'Dilsukhnagar'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);

