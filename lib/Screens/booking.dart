import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Components/booking_positioned.dart';
import '../Components/position.dart';
import '../Components/positioned_container.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  LatLng currentLocation = LatLng(-23.890262, 29.720211);
  LatLng? selectedDestination;
  late GoogleMapController mapController;
  Map<String, Marker> _marker = {};

  void zoomIn() {
    mapController.animateCamera(CameraUpdate.zoomIn());
  }

  // Function to zoom out on the map
  void zoomOut() {
    mapController.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color.fromARGB(255, 114, 154, 248),
              Color.fromARGB(255, 31, 89, 108),
              Color.fromARGB(255, 14, 4, 35)
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 500,
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Stack(
                children: [
                  Position(
                    left: 0,
                    top: 128,
                    title: 'Upcoming Trips',
                  ),
                  PositionedContainer(
                    left: 30,
                    top: 180,
                    title: 'No Trips available',
                    width: 298,
                    height: 70,
                    height2: 2.7,
                    fontSize: 18,
                  ),
                  Position(
                    left: 0,
                    top: 280,
                    title: 'Where would you like to go?',
                  ),
                  Position(
                    left: 0,
                    top: 340,
                    title: 'Pick Up',
                  ),
                  PositionedContainer(
                    left: 130,
                    top: 335,
                    title: 'Student Center',
                    height2: 1.7,
                    fontSize: 18,
                    width: 230,
                    height: 35,
                  ),
                  Position(
                    top: 390,
                    title: 'Destination:',
                    left: 0,
                  ),
                  if (selectedDestination != null)
                    PositionedContainer(
                      title:
                          '${selectedDestination!.latitude}, ${selectedDestination!.longitude}',
                      left: 130,
                      top: 390,
                      width: 230,
                      height: 35,
                      fontSize: 15,
                      height2: 1.2,
                    ),
                  BookingPositioned(
                    left: 180,
                    top: 420,
                    title: 'Book Ride',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: currentLocation,
                          zoom: 15,
                        ),
                        onMapCreated: (controller) {
                          mapController = controller;
                          addMarker('Destination', currentLocation);
                        },
                        markers: Set<Marker>.of(_marker.values),
                        onTap: (LatLng latLng) {
                          addMarker('Destination', latLng);
                        },
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: zoomIn,
                            child: Icon(Icons.zoom_in),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: zoomOut,
                            child: Icon(Icons.zoom_out),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addMarker(String id, LatLng location) async {
    try {
      final marker = await Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
          title: 'Destination',
          snippet: '${location.latitude}, ${location.longitude}',
        ),
      );
      setState(() {
        _marker[id] = marker;
        selectedDestination = location;
      });
    } catch (e) {
      print(e);
    }
  }
}
