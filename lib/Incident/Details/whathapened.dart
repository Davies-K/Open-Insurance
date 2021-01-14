import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/utils/utils.dart';

class WhatHappened extends StatefulWidget {
  @override
  _WhatHappenedState createState() => _WhatHappenedState();
}

class _WhatHappenedState extends State<WhatHappened> {
  int _currentIndex;
  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Choose Incident ",
              style: titleText(context).copyWith(
                  color: primarycolor,
                  fontSize: ww * 0.065,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: ww * 0.10),
          severityContainer("MOTOR ACCIDENT", Colors.red, 1, ww),
          severityContainer("FIRE", Colors.red, 2, ww),
          severityContainer("FLOOD", Colors.red, 3, ww),
          severityContainer("THEFT", Colors.red, 4, ww),
          SizedBox(height: ww * 0.10),
        ],
      ),
    );
  }

  Widget severityContainer(
      String header, Color color, int index, double width) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
          incidentType = header;
        });
      },
      child: Column(
        children: [
          Container(
            width: width * 0.80,
            height: width * 0.15,
            decoration: BoxDecoration(
                color: _currentIndex == index ? primarycolor : Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(header,
                        style: titleText(context).copyWith(
                            color: _currentIndex == index
                                ? Colors.white
                                : primarycolor,
                            fontSize: width * 0.04)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: width * 0.03),
        ],
      ),
    );
  }
}
