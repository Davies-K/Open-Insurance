import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/Incident/Details/severity.dart';
import 'package:pro007/screens/home.dart';
import 'package:pro007/screens/timeline.dart';
import 'package:pro007/utils/utils.dart';
import 'package:pro007/widgets/custom_tab_indicator.dart';
import 'package:toast/toast.dart';

import 'Details/whathapened.dart';
import 'Details/whenhappened.dart';
import 'Details/wherehappened.dart';

class IncidentDetails extends StatefulWidget {
  LatLng initialPos;
  IncidentDetails(this.initialPos);
  @override
  _IncidentDetailsState createState() => _IncidentDetailsState();
}

class _IncidentDetailsState extends State<IncidentDetails>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  bool isLoading = true;
  var newPos;
  int bottomSelectedIndex = 0;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(
      child: Container(
        child: Text('What Happened'),
      ),
    ),
    Tab(
      child: Container(
        child: Text('When Occured'),
      ),
    ),
    Tab(
      child: Container(
        child: Text('Location'),
      ),
    ),
    Tab(
      child: Container(
        child: Text('Evidence'),
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        newPos = widget.initialPos;
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    List<Widget> _widgetOptions = <Widget>[
      WhatHappened(),
      WhenHappened(),
      WhereHappened(),
      Severity(),
      /* CurrentBalances(),
    LastWeek(),
    LastMonth() */
    ];

    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(ww * 0.04),
            key: _scaffoldKey,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
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
                          style:
                              TextStyle(decoration: TextDecoration.underline),
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
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4, top: 18.8),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                      labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                      indicatorPadding:
                          EdgeInsets.only(left: 14.4, right: 14.4),
                      controller: _controller,
                      isScrollable: true,
                      labelColor: Color(0xFF000000),
                      unselectedLabelColor: Color(0xFF8a8a8a),
                      labelStyle: GoogleFonts.raleway(
                          fontSize: 20, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: GoogleFonts.raleway(
                          fontSize: 17, fontWeight: FontWeight.w500),
                      indicator: RoundedRectangleTabIndicator(
                          color: Color(0xFF000000), weight: 2.4, width: 14.4),
                      onTap: (index) {
                        // Should not used it as it only called when tab options are clicked,
                        // not when user swapped
                      },
                      tabs: list),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: ww * 0.05),
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ],
              ),
              _selectedIndex < 3
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _selectedIndex != 0
                            ? InkWell(
                                onTap: () {},
                                child: Container(
                                  width: ww * 0.30,
                                  height: hh * 0.052,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                      child: Text('PREVIOUS',
                                          style: titleText(context).copyWith(
                                              fontSize: ww * 0.035,
                                              color: primarycolor))),
                                ),
                              )
                            : Row(),
                        SizedBox(width: ww * 0.20),
                        _selectedIndex != 3
                            ? InkWell(
                                onTap: () {
                                  _processDetailsOnPage(_controller.index, context);
                                },
                                child: Container(
                                  width: ww * 0.30,
                                  height: hh * 0.052,
                                  decoration: BoxDecoration(
                                      color: primarycolor,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                      child: Text('NEXT',
                                          style: titleText(context)
                                              .copyWith(fontSize: ww * 0.035))),
                                ),
                              )
                            : Row()
                      ],
                    )
                  : Row(),
            ])),
      ),
    );
  }

  _processDetailsOnPage(int index, context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    if (index == 0 && (incidentType == null || incidentType == '')) {
      return dialog(hh, ww, 'Choose Incident Type.', context);
    } else if (index == 1 && (incidentTime == null)) {
      return dialog(hh, ww, 'Select when incident Occurred.', context);
    } else if (index == 2 && (mlongitude == 0 || mlatitude == 0)) {
      return dialog(hh, ww, 'Choose location of incident', context);
    } else {
      setState(() {
        print("tapped");
        _controller.index++;
      });
       Toast.show("Saved", context,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
    }
  }
}
