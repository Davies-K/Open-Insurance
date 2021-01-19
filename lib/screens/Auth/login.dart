import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/screens/Auth/signup.dart';
import 'package:http/http.dart';
import 'package:pro007/utils/utils.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:uuid/uuid.dart';

import 'otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _loginKey = new GlobalKey<ScaffoldState>();
  void shownInSnackbar(String value) {
    _loginKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Raleway",
        fontSize: 13,
      ),
    )));
  }

  final phoneController = TextEditingController();

  bool failed = false;
  bool loggin = false;


  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Scaffold(
        // key: _loginKey,
        resizeToAvoidBottomPadding: false,
        body: Builder(
            builder: (context) => Column(
                  children: <Widget>[
                    Container(
                        height: hh * .5,
                        width: ww,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/bg.jpg'),
                            fit: BoxFit.fitWidth,
                          ),
                          // shape: BoxShape.circle,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 110.0, 0.0, 0.0),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Welcome to",
                                          style: headerText().copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 45,
                                              color: Colors.white),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, ww * 0.03, 0.0, 0.0),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Insurance",
                                          style: titleText(context).copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: ww * 0.12,
                                              color: Colors.white),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(

                        // margin: EdgeInsets.only(top: hh * .1),
                        padding:
                            EdgeInsets.only(top: 35.0, left: 50.0, right: 50.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'PHONE',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primarycolor))),
                            ),
                            SizedBox(height: 50.0),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(right: 20.0),
                      height: hh * .3,
                      width: ww,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              String number = phoneController.text;
                              if (number.length == 10) {
                                confirm(
                                    hh,
                                    ww,
                                    'An sms confirmation will be sent to the number. Make sure it is valid.',
                                    number,
                                    context);
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Incorrect Phone Number.    Please try again."),
                                ));
                              }
                            },
                            child: Container(
                              height: 40.0,
                              width: 180,
                              child: Material(
                                borderRadius: BorderRadius.circular(4.0),
                                color: primarycolor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text('Continue',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Montserrat')),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
  }

  _getSignatureCode() async {
    String signature = await SmsAutoFill().getAppSignature;
    print("signature $signature");
  }

  confirm(
      double hh, double ww, String alert, String number, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0)), //this right here
          child: Container(
            height: hh * .15,
            width: ww * 0.8,
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    Text(
                      alert,
                      style: semiBoldfieldText()
                          .copyWith(color: primarycolor, fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Text(
                      number,
                      style: semiBoldfieldText().copyWith(
                          color: primarycolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 25,
                              width: 100,
                              child: Material(
                                borderRadius: BorderRadius.circular(4.0),
                                color: primarycolor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text('Edit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Montserrat')),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              String number = phoneController.text;
                              Navigator.pop(context);
                              showLoaderDialog(context);
                              
                              _getSignatureCode();
                            },
                            child: Container(
                              height: 25,
                              width: 100,
                              child: Material(
                                borderRadius: BorderRadius.circular(4.0),
                                color: primarycolor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text('Continue',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Montserrat')),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  
}
