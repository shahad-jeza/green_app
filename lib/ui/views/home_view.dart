import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Set<Marker> markers = new Set();

  Set<Marker> getMarkers() { //markers to place on map

    return markers;
  }


  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        width: double.infinity,
        height: size.height,
        color: Colors.green[50],
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
              child: Text('what do you need to recycle ? ' ,
                style: TextStyle(
                  fontSize: 24 ,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Container(
              height: 114,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/plastic.png'),
                    iconSize: 117,
                    onPressed: ()  {
                      setState(() {
                        markers.clear();
                        markers.add(const Marker( //add first marker
                          markerId: MarkerId("one"),
                          position: LatLng(21.53971, 39.25012), //position of marker
                          infoWindow: InfoWindow( //popup info
                            title: 'Marker Title First ',
                            snippet: 'My Custom Subtitle',
                          ),
                          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
                        ));

                        markers.add(const Marker(//add second marker
                          markerId: MarkerId("scn"),
                          position: LatLng(21.15655166097582, 39.326038716024186),

                          infoWindow: InfoWindow( //popup info
                            title: 'WSCO ',
                            snippet: '12 Ryals / killo',
                          ),
                          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
                        ));

                        //add more markers here
                      });

                    },
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/paper.png'),
                    iconSize: 117,
                    onPressed: () {

                      setState(() {
                        markers.clear();
                        markers.add(const Marker( //add first marker
                          markerId: MarkerId("tow"),
                          position: LatLng(21.53971, 39.25012), //position of marker
                          infoWindow: InfoWindow( //popup info
                            title: 'Marker Title 2 ',
                            snippet: 'My Custom Subtitle',
                          ),
                          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
                        ));

                        markers.add(const Marker( //add second marker
                          markerId: MarkerId("thrre"),
                          position: LatLng(21.4269952, 39.7279232), //position of marker
                          infoWindow: InfoWindow( //popup info
                            title: 'Marker Title 3 ',
                            snippet: 'My Custom Subtitle',
                          ),
                          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
                        ));

                        //add more markers here
                      });

                    },
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/metal.png'),
                    iconSize: 117,
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/glass.png'),
                    iconSize: 117,
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/organic.png'),
                    iconSize: 117,
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/electronics.png'),
                    iconSize: 117,
                    onPressed: () {},
                  ),
                ],

              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 145, 10),
              child: Text('places near you :  ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24 ,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),),
            ),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
              ),
              width: 365,
              height: 300,
              child : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _initialCameraPosition,
                markers: getMarkers(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,

              ),
            ),
          ],
        ),
      ),
    );
  }



}

