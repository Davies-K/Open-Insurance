import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/screens/GetQuote/computation.dart';

import 'GetQuote/getQuoteForm.dart';

class PackageDetails extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String details;
  final List<String> description;
  const PackageDetails(
      this.imageUrl, this.title, this.details, this.description);

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Container(
          child: FloatingActionButton.extended(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: Container(
              alignment: Alignment.center,
              width: ww * 0.8,
              child: Text(
                'GET INSURANCE',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            elevation: 30,
            // icon: Icon(Icons.warning),
            backgroundColor: Colors.white,

            foregroundColor: Colors.black,
            tooltip: 'Report Incident',
            onPressed: () => {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Incident(_initialPosition)))
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
            child: Stack(children: <Widget>[
          Container(width: ww, height: hh, color: Colors.white),
          Container(
              padding: EdgeInsets.all(ww * 0.04),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6.0,
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5.0)
                              ]),
                          child: Icon(Feather.arrow_left,
                              size: 25.0, color: Colors.white)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            // color: primarycolor,
                            borderRadius: BorderRadius.circular(12),
                            // boxShadow: [
                            //   BoxShadow(
                            //       blurRadius: 6.0,
                            //       color: Colors.grey.withOpacity(0.5),
                            //       spreadRadius: 5.0)
                            // ]
                          ),
                          child: Image(
                            image: AssetImage(
                              widget.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          )

                          // child: Icon(Feather.arrow_left,
                          //     size: 25.0, color: Colors.white)

                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: headerText().copyWith(color: primarycolor),
                    )
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
                SizedBox(height: ww * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ww * 0.70,
                      child: new Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '',
                              style: headerText(),
                              children: <TextSpan>[
                                TextSpan(
                                    text: widget.details,
                                    style: paragraphText().copyWith(
                                        fontSize: ww * 0.035,
                                        color: textColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ])),
          Positioned(
              bottom: 0,
              child: Container(
                  width: ww,
                  height: hh * 0.55,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Stack(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 35, bottom: 16),
                        child: extra_det(context)),
                    // Positioned(
                    //     bottom: ww * 0.03,
                    //     left: ww * 0.30,
                    //     right: ww * 0.30,
                    //     child: InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => Computation()));
                    //       },
                    //       child: Container(
                    //           width: ww * 0.30,
                    //           height: hh * 0.065,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(2))),
                    //           child: Center(
                    //               child: Text('GET QUOTE',
                    //                   style: headerText()
                    //                       .copyWith(color: textColor)))),
                    //     ))
                  ])))
        ])));
  }

  Widget extra_det(BuildContext context) {
    final children = <Widget>[];
    for (int i = 0; i < widget.description.length; i++) {
      children.add(point(widget.description[i], context));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget point(String det, BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: ww * 0.8,
          child: RichText(
            text: TextSpan(
              text: '• ',
              style: headerText(),
              children: <TextSpan>[
                TextSpan(
                    text: det,
                    style: headerText().copyWith(fontSize: ww * 0.030)),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
