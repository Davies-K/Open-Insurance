import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/utils/utils.dart';
import 'package:swipe_button/swipe_button.dart';

import 'incidentDetails.dart';

class Incident extends StatefulWidget {
  LatLng initialPos;
  Incident(this.initialPos);
  @override
  _IncidentState createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.initialPos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(ww * 0.04),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      //color: primarycolor,
                      borderRadius: BorderRadius.circular(30),
                      /* boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5.0)
                          ] */
                    ),
                    child: Icon(Feather.arrow_left,
                        size: 25.0, color: primarycolor)),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Cancel',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    Text(
                      'To Home',
                      style: fieldText(context)
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
          heightSpace1,
          Padding(
            padding: EdgeInsets.only(left: ww * 0.03, top: ww * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Incident",
                    style: titleText(context).copyWith(
                        color: primarycolor,
                        fontSize: ww * 0.095,
                        fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    /* Navigator.pop(context); */
                  },
                  child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5.0)
                          ]),
                      child:
                          Icon(Feather.mail, size: 25.0, color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: ww * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: ww * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: ww * 0.80,
                        child: Column(
                          children: [
                            Text(
                              'Incident Reporting Provision — a provision in a liability insurance policy that requires or allows the insured to report incidents, accidents, or occurrences that may lead to claims. Also called an "awareness provision" or a "notice of potential claim provision."',
                              style: headerText().copyWith(
                                  fontSize: ww * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: primarycolor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ww * 0.05),
                  Row(
                    children: [
                      Text(
                        'Tips on Reporting Incident.',
                        style: headerText().copyWith(color: primarycolor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ww * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        'Choose Date and Time',
                        style: headerText().copyWith(
                            fontSize: ww * 0.035,
                            fontWeight: FontWeight.w500,
                            color: primarycolor),
                      ),
                    ],
                  ),
                  SizedBox(height: ww * 0.03),
                  Row(
                    children: [
                      Text(
                        'Severity',
                        style: headerText().copyWith(
                            fontSize: ww * 0.035,
                            fontWeight: FontWeight.w500,
                            color: primarycolor),
                      ),
                    ],
                  ),
                  SizedBox(height: ww * 0.03),
                  Row(
                    children: [
                      Text(
                        'What Happened ? ',
                        style: headerText().copyWith(
                            fontSize: ww * 0.035,
                            fontWeight: FontWeight.w500,
                            color: primarycolor),
                      ),
                    ],
                  ),
                  SizedBox(height: ww * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Where it Happened?',
                        style: headerText().copyWith(
                            fontSize: ww * 0.035,
                            fontWeight: FontWeight.w500,
                            color: primarycolor),
                      ),
                    ],
                  ),
                  SizedBox(height: ww * 0.03),
                ],
              ),
            ),
          ),
          SizedBox(height: hh * 0.25),
          Center(
            child: Container(
              height: hh * 0.14,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SwipeButton(
                  thumb: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                          widthFactor: 0.90,
                          child: Icon(
                            Icons.chevron_right,
                            size: ww * 0.15,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  content: Center(
                    child: Text(
                      "SWIPE TO REPORT INCIDENT.",
                      style: titleText(context).copyWith(fontSize: ww * 0.03),
                    ),
                  ),
                  onChanged: (result) {
                    if (result == SwipePosition.SwipeRight) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  IncidentDetails(widget.initialPos)));
                    } else {}
                  },
                ),
              ),
            ),
          ),

          /* Expanded(
            child: Positioned(
              bottom: ww * 0.02,
              child: Column(
                children: [

                ],
              ),)) */
        ],
      ),
    ));
  }
}
