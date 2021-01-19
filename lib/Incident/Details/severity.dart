import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'package:pro007/screens/home.dart';
import 'package:pro007/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class Severity extends StatefulWidget {
  @override
  _SeverityState createState() => _SeverityState();
}

class _SeverityState extends State<Severity> {
  int _currentIndex;
  String tel;
  bool isLoading = false;
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
      evidence = Image.file(File(pickedFile.path));
    });
    //Navigator.pop(context);
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      evidence = Image.file(File(pickedFile.path));
    });
    //Navigator.pop(context);
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Updating..'),
      ),
    );

  }

  @override
  void initState() {
    /*  _showBottomAction(context); */
    // TODO: implement initState
    super.initState();
    // _showBottomAction();
  }

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 18.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Evidence",
                      style: titleText(context).copyWith(
                          color: primarycolor,
                          fontSize: ww * 0.065,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: ww * 0.10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: ww * 0.18,
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
                          child: Text('Skip Evidence',
                              style: titleText(context).copyWith(
                                  fontSize: ww * 0.025,
                                  color: primarycolor,
                                  decoration: TextDecoration.underline))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ww * 0.04),
              Container(
                width: ww * 0.85,
                height: hh * 0.30,
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
                child: _image == null
                    ? DottedBorder(
                        color: textColor,
                        strokeCap: StrokeCap.round,
                        borderType: BorderType.RRect,
                        dashPattern: [2, 4],
                        radius: Radius.circular(4),
                        strokeWidth: 1,
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.cloud_upload,
                                          size: ww * 0.10, color: textColor),
                                      Text(
                                        "Upload Evidence",
                                        style: TextStyle(
                                            color: textColor,
                                            fontFamily: "nunito",
                                            fontSize: ww * 0.026),
                                      )
                                    ]),
                              )),
                        ),
                      )
                    : Image.file(_image, fit: BoxFit.contain),
              ),
              SizedBox(
                height: ww * 0.06,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child: Container(
                          width: ww * 0.30,
                          height: hh * 0.048,
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
                  ),
                ],
              ),
              SizedBox(
                height: ww * 0.05,
              ),
              Container(
                  height: hh * 0.272,
                  width: ww * 0.85,
                  //
                  child: Column(children: <Widget>[
                    // Padding(
                    //   padding:  EdgeInsets.only(top: ww * 0.10),
                    //   child: Text("Create Vehicle.", style: titleText(context).copyWith(color: primarycolor),),
                    // ),
                    SizedBox(height: 7),
                    Container(
                      width: 50,
                      height: 5.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE7EBEE),
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Choose Image Source",
                              style: fieldText(context)
                                  .copyWith(fontSize: ww * 0.032)),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        SizedBox(height: ww * 0.05),
                        InkWell(
                          onTap: getImageFromGallery,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.photo_album),
                                      onPressed: null),
                                  Text("Gallery",
                                      style: titleText(context).copyWith(
                                          color: primarycolor,
                                          fontSize: ww * 0.04,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Container(
                                  width: ww * 0.05,
                                  height: ww * 0.05,
                                  decoration: BoxDecoration()),
                            ],
                          ),
                        ),
                        SizedBox(height: ww * 0.05),
                        Divider(height: 1),
                        SizedBox(height: ww * 0.05),
                        InkWell(
                          onTap: getImageFromCamera,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.camera),
                                      onPressed: null),
                                  Text("Camera",
                                      style: titleText(context).copyWith(
                                          color: primarycolor,
                                          fontSize: ww * 0.04,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Container(
                                  width: ww * 0.05,
                                  height: ww * 0.01,
                                  decoration: BoxDecoration()),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomAction() {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              height: hh * 0.27,
              color: Colors.white,
              child: Column(children: <Widget>[
                // Padding(
                //   padding:  EdgeInsets.only(top: ww * 0.10),
                //   child: Text("Create Vehicle.", style: titleText(context).copyWith(color: primarycolor),),
                // ),
                SizedBox(height: 7),
                Container(
                  width: 50,
                  height: 5.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFE7EBEE),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Choose Image Source",
                        style:
                            fieldText(context).copyWith(fontSize: ww * 0.03)),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Text("Skip Now",
                          style: fieldText(context).copyWith(
                              fontSize: ww * 0.02,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(height: ww * 0.05),
                    InkWell(
                      onTap: getImageFromGallery,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.photo_album),
                                  onPressed: null),
                              Text("Gallery",
                                  style: titleText(context).copyWith(
                                      color: primarycolor,
                                      fontSize: ww * 0.04,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Container(
                              width: ww * 0.05,
                              height: ww * 0.05,
                              decoration: BoxDecoration()),
                        ],
                      ),
                    ),
                    SizedBox(height: ww * 0.05),
                    Divider(height: 1),
                    SizedBox(height: ww * 0.05),
                    InkWell(
                      onTap: getImageFromCamera,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.camera), onPressed: null),
                              Text("Camera",
                                  style: titleText(context).copyWith(
                                      color: primarycolor,
                                      fontSize: ww * 0.04,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Container(
                              width: ww * 0.05,
                              height: ww * 0.05,
                              decoration: BoxDecoration()),
                        ],
                      ),
                    ),
                  ],
                )
              ]));
        });
  }
}
