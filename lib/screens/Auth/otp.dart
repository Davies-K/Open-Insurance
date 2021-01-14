import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/screens/Auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../home.dart';
import '../timeline.dart';

class OTP extends StatefulWidget {
  final int status;
  final int otp;
  final String numb;
  final String keyCode;
  const OTP(
    this.otp,
    this.status,
    this.keyCode,
    this.numb,
  );

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String _code;
  final String PHONE_KEY = "UserNumber";
  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              height: hh * .3,
              width: ww,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg2.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                // shape: BoxShape.circle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: hh * .29,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 10.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Enter your Insurance confirmation code",
                                style: headerText().copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
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
            padding: EdgeInsets.only(top: 50, left: 60, right: 60),
            child: TextFieldPinAutoFill(
              autofocus: true,
              style: TextStyle(fontSize: 14),
              currentCode: _code, // prefill with a code
              onCodeSubmitted: (code) async {
                int val = int.tryParse(code) ?? 00;
                if (val == widget.otp && widget.status == 500) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUp(widget.numb, widget.keyCode)),
                      ModalRoute.withName("/SignUp(widget.numb)"));
                } else if (val == widget.otp && widget.status == 200) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs?.setBool("isLoggedIn", true);
                  prefs.setString(PHONE_KEY, widget.numb);
                  prefs.setString('keyCode', widget.keyCode);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      ModalRoute.withName("/Home"));
                } else {}
              }, //code submitted callback
              onCodeChanged: (code) async {
                int val = int.tryParse(code) ?? 00;
                if (val == widget.otp && widget.status == 500) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUp(widget.numb, widget.keyCode)),
                      ModalRoute.withName("/SignUp(widget.numb)"));
                } else if (val == widget.otp && widget.status == 200) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs?.setBool("isLoggedIn", true);
                  prefs?.setString(PHONE_KEY, widget.numb);
                  prefs.setString('keyCode', widget.keyCode);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      ModalRoute.withName("/Home"));
                } else {}
              }, //code submitted, //code changed callback
              codeLength: 4, //code length, default 6
            ),
          ),
        ],
      ),
    );
  }
}
