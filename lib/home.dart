import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class home extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();

}

class _homePageState extends State<home> {

  int currentIndex = 1;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(43.233074, 76.890443),
    zoom: 12,
  );


  List<Marker> customMarkers = [];

  @override
  void initState() {
    get_markers();
    super.initState();
  }

  get_markers() {
    Marker marker1 = Marker(
      markerId: MarkerId('marker1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: LatLng(43.226867, 76.883621),
    );
    Marker marker2 = Marker(
      markerId: MarkerId('marker2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: LatLng(43.234592, 76.886349),
    );
    Marker marker3 = Marker(
      markerId: MarkerId('marker3'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: LatLng(43.231815, 76.894732),
    );

    customMarkers.add(marker1);
    customMarkers.add(marker2);
    customMarkers.add(marker3);
    setState(() {

    });
  }

  ///////////
  getIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 0, right: 20),
        child: ListView(
          children: <Widget>[
            Container(
                height: 90,
                child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.grey[200],
                        elevation: 0,
                        bottom: TabBar(
                            onTap: (index){
                              getIndex(index);
                            },
                            unselectedLabelColor: Color(0xFF47536d),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF47536d)),
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Color(0xFF47536d), width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Список"),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Color(0xFF47536d), width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("На карте"),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ))),

            if (currentIndex == 0)
              Container(
                height: 100,
                margin: EdgeInsets.only(bottom: 3),
              ),
            if (currentIndex == 1)
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 500,
                width: 500,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: customMarkers.map((points) => points).toSet(),
                ),
              )
          ],
        ),
      ),
    );
  }
}