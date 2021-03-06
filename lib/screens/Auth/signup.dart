import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:http/http.dart';
import 'package:pro007/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../home.dart';
import '../timeline.dart';

class SignUp extends StatefulWidget {
  String numb;
  final keyCode;

  SignUp(this.numb, this.keyCode);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> _signupKey = new GlobalKey<ScaffoldState>();
  final String PHONE_KEY = "UserNumber";
  void shownInSnackbar(String value) {
    _signupKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Raleway",
        fontSize: 13,
      ),
    )));
  }

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  bool signin = false;

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    return Scaffold(
        // key: _signupKey,
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: hh * .25),
                  padding: EdgeInsets.only(top: 35.0, left: 50.0, right: 50.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextField(
                          controller: firstnameController,
                          decoration: InputDecoration(
                              labelText: 'First Name ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primarycolor))),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor))),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: emailController,
                        validator: validateEmail,
                        decoration: InputDecoration(
                            labelText: 'e-mail ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor))),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 40.0,
                          width: 180,
                          child: InkWell(
                            onTap: () {
                              String fname = firstnameController.text;
                              String lname = lastnameController.text;
                              String email = emailController.text;

                             
                             
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(4.0),
                              color: primarycolor,
                              elevation: 0,
                              child: Center(
                                child: Text(
                                  'Finish',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )),
            ]));
  }
}
