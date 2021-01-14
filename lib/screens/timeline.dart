import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/Incident/incident.dart';
import 'package:pro007/screens/packageDetail.dart';
import 'package:story_view/story_view.dart';
import 'package:pro007/utils/utils.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  LatLng _initialPosition;

  int currentTab = 0;
  final StoryController storyController = StoryController();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            'REPORT INCIDENT',
            style: headerText().copyWith(fontSize: 13),
          ),
          icon: Icon(Icons.warning),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          tooltip: 'Report Incident',
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Incident(_initialPosition)))
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: ww,
                  height: hh * 0.12,
                  decoration: BoxDecoration(
                    color: primarycolor,
                  ),
                ),
                Positioned(
                    left: 16,
                    right: 16,
                    top: ww * 0.07,
                    child: Text('Quick Actions',
                        style: headerText()
                            .copyWith(color: Colors.white, fontSize: 13))),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.3,
                          right: MediaQuery.of(context).size.width * 0.028),
                      height: MediaQuery.of(context).size.height * 0.10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 20.0,
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 10.0),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // MaterialButton(
                          //   minWidth: 40,
                          //   onPressed: () async {
                          //     setState(
                          //       () {
                          //         currentTab = 1;
                          //       },
                          //     );
                          //   },
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: <Widget>[
                          //       Icon(Icons.receipt,
                          //           size: 35,
                          //           color: currentTab == 1
                          //               ? primarycolor
                          //               : Colors.grey),
                          //       Text(
                          //         'Get Quote',
                          //         style: TextStyle(
                          //           fontFamily: 'Montserrat',
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: ww * 0.025,
                          //           color: currentTab == 1
                          //               ? primarycolor
                          //               : Colors.grey[900],
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          MaterialButton(
                            // minWidth: 40,
                            onPressed: () async {
                              setState(
                                () {
                                  currentTab = 2;
                                },
                              );
                            },

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.cached,
                                    size: 35,
                                    color: currentTab == 2
                                        ? primarycolor
                                        : Colors.grey),
                                Text(
                                  ' Renew ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: ww * 0.025,
                                    color: currentTab == 2
                                        ? primarycolor
                                        : Colors.grey[900],
                                  ),
                                )
                              ],
                            ),
                          ),
                          MaterialButton(
                            // minWidth: 40,
                            onPressed: () async {
                              setState(
                                () => {currentTab = 3},
                              );
                            },

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.card_giftcard,
                                    size: 35,
                                    color: currentTab == 3
                                        ? primarycolor
                                        : Colors.grey),
                                Text(
                                  'Claims',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: ww * 0.025,
                                    color: currentTab == 3
                                        ? primarycolor
                                        : Colors.grey[900],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    // Text('Featured',
                    //     style: headerText().copyWith(
                    //         color: textColor,
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.bold)),
                    SizedBox(height: hh * 0.01),
                    Container(
                      width: ww,
                      height: hh * 0.10,
                      // child: StoryView(
                      //   controller: storyController,
                      //   storyItems: [
                      //     // StoryItem.inlineImage(
                      //     //   NetworkImage(
                      //     //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
                      //     //   caption: Text(
                      //     //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
                      //     //     style: TextStyle(
                      //     //       color: Colors.white,
                      //     //       backgroundColor: Colors.black54,
                      //     //       fontSize: 17,
                      //     //     ),
                      //     //   ),
                      //     // ),

                      //     StoryItem.inlineImage(
                      //       url:
                      //           "https://www.parking-mobility.org/wp-content/uploads/2019/08/Insurance.jpg",
                      //       controller: storyController,
                      //       roundedTop: false,
                      //       caption: Text(
                      //         "Quality Insurance Company.",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           backgroundColor: Colors.black54,
                      //           fontSize: 11,
                      //         ),
                      //       ),
                      //     ),
                      //     StoryItem.inlineImage(
                      //       url:
                      //           "https://lh3.googleusercontent.com/7LUhHO0naz9tz-aHnSF491Z7MrP7GsHg3Walwg3loy1skdVfaqI6pCb3rP6AIBR-rw",
                      //       controller: storyController,
                      //       roundedTop: false,
                      //       caption: Text(
                      //         "Insured.",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           backgroundColor: Colors.black54,
                      //           fontSize: 11,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      //   onStoryShow: (s) {
                      //     print("Showing a story");
                      //   },
                      //   onComplete: () {
                      //     print("Completed a cycle");
                      //   },
                      //   progressPosition: ProgressPosition.bottom,
                      //   repeat: false,
                      //   inline: true,
                      // )
                    ),
                    SizedBox(height: hh * 0.02),
                    //SizedBox(height: hh * 0.20),
                    Text('Get Insurance',
                        style: headerText().copyWith(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: hh * 0.02),
                    Container(
                      width: ww,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildPackage(
                                    'Motor',
                                    Icons.fact_check_outlined,
                                    hh,
                                    ww,
                                    'assets/images/carAsset.png',
                                    motor_detail,
                                    motor_points,
                                    Color.fromRGBO(243, 80, 54, 1)),
                                buildPackage(
                                    'Travel',
                                    Icons.fact_check_outlined,
                                    hh,
                                    ww,
                                    'assets/images/travel.png',
                                    travel_detail,
                                    travel_points,
                                    Color.fromRGBO(243, 80, 54, 1)),
                                buildPackage(
                                    'Fire',
                                    Icons.fact_check_outlined,
                                    hh,
                                    ww,
                                    'assets/images/fire.png',
                                    fire_detail,
                                    fire_points,
                                    Color.fromRGBO(243, 80, 54, 1)),
                              ],
                            ),
                            Divider(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildPackage(
                                    'Marine',
                                    Icons.fact_check_outlined,
                                    hh,
                                    ww,
                                    'assets/images/marine.png',
                                    '',
                                    null,
                                    Color.fromRGBO(243, 80, 54, 1)),
                                buildPackage(
                                    'Aviation',
                                    Icons.bar_chart,
                                    hh,
                                    ww,
                                    'assets/images/aviation.png',
                                    '',
                                    null,
                                    Color.fromRGBO(243, 80, 54, 1)),
                                buildPackage(
                                    'Accident',
                                    Icons.fact_check_outlined,
                                    hh,
                                    ww,
                                    'assets/images/vehicleac.png',
                                    '',
                                    null,
                                    Color.fromRGBO(243, 80, 54, 1)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
  //
  // InkWell buildPackage(String assetsLink, String label, String detail,
  //     List<String> extra_detail) {
  //   var ww = MediaQuery.of(context).size.width;
  //   var hh = MediaQuery.of(context).size.height;
  //   return InkWell(
  //     onTap: () {
  //       if (detail?.isNotEmpty ?? true) {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) =>
  //                     PackageDetails(assetsLink, label, detail, extra_detail)));
  //       } else {
  //         dialog(hh, ww, NA_alert, context);
  //       }
  //     },
  //     child: Column(
  //       children: [
  //         Container(
  //           width: ww * 0.25,
  //           height: ww * 0.20,
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: AssetImage(assetsLink),
  //               fit: BoxFit.fill,
  //             ),
  //             // shape: BoxShape.circle,
  //           ),
  //         ),
  //         SizedBox(height: 4),
  //         Text(label, style: smallTextLabel())
  //       ],
  //     ),
  //   );
  // }

  Widget buildPackage(
    String label,
    IconData icon,
    double hh,
    double ww,
    String assetsLink,
    String detail,
    List<String> extra_detail,
    Color fg,
  ) {
    return Container(
      height: hh * 0.15,
      width: hh * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
              semanticContainer: true,
              color: Colors.white,
              shadowColor: Colors.grey[50],
              elevation: 20,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                splashColor: Colors.red.withAlpha(30),
                onTap: () {
                  if (detail?.isNotEmpty ?? true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PackageDetails(
                                assetsLink, label, detail, extra_detail)));
                  } else {
                    dialog(hh, ww, NA_alert, context);
                  }
                },
                child: Container(
                  height: hh * 0.1,
                  width: hh * 0.1,
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    icon,
                    color: fg,
                  ),
                ),
              )),
          Container(
            width: hh * 0.08,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          )
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

    print(
        "the latitude is: ${position.longitude} and th longitude is: ${position.longitude} ");
    print("initial position is : ${_initialPosition.toString()}");
  }
}
