import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pro007/utils/utils.dart';

class WhereHappened extends StatefulWidget {
  @override
  _WhereHappenedState createState() => _WhereHappenedState();
}

class _WhereHappenedState extends State<WhereHappened> {
  LatLng _initialPosition;
  // map locations data
  double latitude;
  double longitude;
  String venue = "";

  LatLng currentPosition;

  @override
  void initState() {
    _getUserLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Location ",
                  style: titleText(context).copyWith(
                      color: primarycolor,
                      fontSize: ww * 0.075,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlacePicker(
                                apiKey: kGoogleApiKey, // Put YOUR OWN KEY here.
                                onPlacePicked: (result) {
                                  // setState(() {
                                  //   latitude = result.geometry.location.lat;
                                  //
                                  //   longitude = result.geometry.location.lng;
                                  //   currentPosition = LatLng(
                                  //       result.geometry.location.lat,
                                  //       result.geometry.location.lng);
                                  //   venue = result.formattedAddress;
                                  // });
                                  address = result.formattedAddress;
                                  mlatitude = result.geometry.location.lat;
                                  mlongitude = result.geometry.location.lng;
                                  print(result.formattedAddress);
                                  Navigator.pop(context);
                                  /*  setState(() {
                                          _locationController.text = venue;
                                        }); */
                                },

                                initialPosition: _initialPosition,

                                useCurrentLocation: true,
                              )));
                },
                child: Container(
                  width: ww * 0.30,
                  height: hh * 0.032,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2.0),
                      ],
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Text('CHANGE LOCATION',
                          style: titleText(context).copyWith(
                              fontSize: ww * 0.025, color: primarycolor))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: ww * 0.85,
                height: hh * 0.50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white,
                  /* boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0),
                    ] */
                ),
                child: _initialPosition == null
                    ? Container(
                        color: Colors.white,
                      )
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: _initialPosition,
                          zoom: 18,
                        ),
                        myLocationEnabled: true,
                        compassEnabled: true,
                        /* markers: Set.of((marker != null) ? [marker] : []),
                      circles: Set.of((circle != null) ? [circle] : []),
                      polylines: _polyLines, */
                        onMapCreated: (GoogleMapController controller) {
                          /* setState(() {
                          _controller = controller;
                        }); */
                          //_controller.setMapStyle(_mapStyle);
                        },
                      ),
              ),
            ],
          ),
          Column(
            children: [Text('')],
          ),
          SizedBox(
            height: ww * 0.05,
          ),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ),
              SizedBox(width: ww * 0.20),
              InkWell(
                onTap: () {},
                child: Container(
                  width: ww * 0.30,
                  height: hh * 0.052,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Text('SUBMIT',
                          style: titleText(context)
                              .copyWith(fontSize: ww * 0.035))),
                ),
              )
            ],
          ) */
        ],
      ),
    );
  }

  // ! TO GET THE USERS LOCATION
  void _getUserLocation() async {
    print("GET USER METHOD RUNNING =========");
    Position position = await Geolocator().getCurrentPosition();
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);

      //_heading = position.heading;
      // locationController.text = placemark[0].name;
    });
    if (mlatitude == null) {
      mlatitude = position.latitude;
      mlongitude = position.longitude;
    }
    print(
        "the latitude is: ${position.longitude} and th longitude is: ${position.longitude} ");
    print("initial position is : ${_initialPosition.toString()}");
  }
}
